import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tic_tac_toe/controllers/invitation_timer_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/models/online/online_user.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/dialogs/challenge_dialog.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/dialogs/invitation_dialog.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/dialogs/invitation_timeout_dialog.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/dialogs/rejected_dialog.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/dialogs/waiting_dialog.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_game/components/dialogs/opponent_quit_game_dialog.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_game/components/dialogs/quit_game_dialog.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/online_user_status.dart';
import 'package:get/get.dart';

class OnlineUserController extends GetxController {
  static OnlineUserController to = Get.find();

  late OnlineUser currentUser;
  OnlineUser? opponent;
  // final String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';
  OnlineUserStatus oldCurrentUserStatus = OnlineUserStatus.idle;
  String opponentId = '';
  // OnlineUserStatus? opponentStatus;

  @override
  void onReady() {
    super.onReady();
    _watchUserFromFirebase();
  }

  void _watchUserFromFirebase() {
    // listen for current user
    firestoreService.watchUser(FirebaseAuth.instance.currentUser?.uid ?? '').listen((snapshot) {
      if (snapshot.exists) {
        currentUser = snapshot.data() as OnlineUser;
        opponentId = currentUser.opponentId;
        _watchOpponentUser();
        _handleUserStatus();
      }
    });
    update();
  }

  void _watchOpponentUser() async {
    await firestoreService.watchUser(currentUser.opponentId).listen((snapshot) {
      opponent = snapshot.data() as OnlineUser;
    });
  }

  void _handleUserStatus() {
    if (oldCurrentUserStatus != currentUser.status) {
      switch (currentUser.status) {
        case OnlineUserStatus.idle:
          _handleIdleStatus();
          break;
        case OnlineUserStatus.waitingForInvitation:
          _handleWaitingForInvitationStatus();
          break;
        case OnlineUserStatus.invited:
          _handleInvitedStatus();
          break;
        case OnlineUserStatus.invitaionWaitingCanceled:
          _handleInvitationWaitingCanceledStatus();
          break;
        case OnlineUserStatus.invitationRejected:
          _handleInvitationRejectedStatus();
          break;
        case OnlineUserStatus.inGame:
          _handleInGameStatus();
          break;
        case OnlineUserStatus.opponentQuitted:
          _handleOpponentQuittedStatus();
          break;
        case OnlineUserStatus.invitationWaitingTimeout:
          _handleInvitationWaitingTimeoutStatus();
          break;
        case OnlineUserStatus.invitedButNoRespond:
          _handleInvitedButNoRespondStatus();
          break;
        default:
          break;
      }
      oldCurrentUserStatus = currentUser.status;
    }
  }

  void _handleIdleStatus() {
    // handle idle status
  }

  void _handleWaitingForInvitationStatus() {
    Get.back();
    Get.dialog(WaitingDialog(), barrierDismissible: false);
  }

  void _handleInvitedStatus() {
    Get.back();
    Get.dialog(InvitationDialog(), barrierDismissible: false);
  }

  void _handleInvitationWaitingCanceledStatus() {
    Get.back();
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.idle);
  }

  void _handleInvitationRejectedStatus() {
    Get.back();
    Get.dialog(RejectedDialog(), barrierDismissible: false);
  }

  void _handleInGameStatus() async {
    // player 2 (index: 1) create room instance and upload to firestore,
    // therefore, player 1 (index 0) should get the room from firestore
    if (currentUser.playerIndex == 0) {
      OnlineGameController.to.currentRoomId = opponent!.currentRoomId;
      final userData = {
        'currentRoomId': opponent!.currentRoomId
      };
      firestoreService.updateUser(firebaseAuth.currentUser!.uid, userData);
      OnlineGameController.to.pullRoomFromFirebase();
    }
    Get.offNamed(Routes.ONLINE_GAME);
  }

  void _handleOpponentQuittedStatus() {
    Get.until((route) => !Get.isDialogOpen!);
    Get.dialog(OpponentQuitGameDialog(), barrierDismissible: false);
  }

  void _handleInvitationWaitingTimeoutStatus() {
    Get.back();
    Get.dialog(InvitationTimeoutDialog(), barrierDismissible: false);
    updateCurrentUserStatus(OnlineUserStatus.idle);
  }

  void _handleInvitedButNoRespondStatus() {
    Get.until((route) => !Get.isDialogOpen!);
    updateCurrentUserStatus(OnlineUserStatus.idle);
  }

  void saveCurrentUserToFirestore() {
    firestoreService.addUser(currentUser);
    logger.t('save current user to firebase');
    logger.t('Room{id: ${currentUser.uid}, currentRoomId: ${currentUser.currentRoomId}}');
    update();
  }

  void quitGame() {
    if (oldCurrentUserStatus == OnlineUserStatus.opponentQuitted) {
      quitGameWhenOpponentQuited();
    } else {
      Get.dialog(QuitGameDialog(), barrierDismissible: false);
    }
  }

  void handleInvitationWaitingCancel() {
    firestoreService.updateUserStatus(
        currentUser.uid, OnlineUserStatus.invitaionWaitingCanceled);
    firestoreService.updateUserStatus(
        opponentId, OnlineUserStatus.invitaionWaitingCanceled);
    removeOpponentForBothUsers();
    update();
  }

  void handleInvitationTimeout() {
    firestoreService.updateUserStatus(
        currentUser.uid, OnlineUserStatus.invitationWaitingTimeout);
    firestoreService.updateUserStatus(
        opponentId, OnlineUserStatus.invitedButNoRespond);
    removeOpponentForBothUsers();
    update();
  }

  void startChallengeAnotherUser() {
    final currentUserData = {
      'opponentId': opponentId,
      'playerIndex': 0,
      'status': OnlineUserStatus.waitingForInvitation.toShortString()
    };
    final opponentData = {
      'opponentId': currentUser.uid,
      'playerIndex': 1,
      'status': OnlineUserStatus.invited.toShortString()
    };
    firestoreService.updateUser(currentUser.uid, currentUserData);
    firestoreService.updateUser(opponentId, opponentData);
    update();
  }

  void acceptChallengeFromOpponent() {
    OnlineGameController.to.createRoom();
    OnlineGameController.to.pushRoomToFirebase();
    final currentUserData = {'status': OnlineUserStatus.inGame.toShortString()};
    final opponentData = {'status': OnlineUserStatus.inGame.toShortString()};
    firestoreService.updateUser(currentUser.uid, currentUserData);
    firestoreService.updateUser(opponentId, opponentData);
    update();
  }

  void rejectInvitation() {
    Get.back();
    firestoreService.updateUserStatus(currentUser.uid, OnlineUserStatus.idle);
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.invitationRejected);
    removeOpponentForBothUsers();
    update();
  }

  void selectOpponent(OnlineUser user)  {
    Get.dialog(ChallengeDialog(), barrierDismissible: false);
    opponent = user;
    opponentId = user.uid;
    update();
  }

  void cancelInvitationWaiting() {
    Get.back();
    InvitationTimerController.to.stopTimer();
    firestoreService.updateUserStatus(currentUser.uid, OnlineUserStatus.idle);
    firestoreService.updateUserStatus(
        opponentId, OnlineUserStatus.invitaionWaitingCanceled);
    removeOpponentForBothUsers();
    update();
  }

  /// This method is called when a player quit the game (press "Quit Button" on Quit Game Dialog).
  void quitGameSuddenly() {
    final currentUserData = {
      'status': OnlineUserStatus.idle.toShortString(),
      'opponentId': '',
      'currentRoomId': ''
    };
    final opponentData = {
      'status': OnlineUserStatus.opponentQuitted.toShortString(),
      'opponentId': '',
      'currentRoomId': ''
    };
    Get.offNamed(Routes.HOME_ONLINE);
    firestoreService.updateUser(currentUser.uid, currentUserData);
    firestoreService.updateUser(opponentId, opponentData);
    update();
  }

  /// When the opponent left the game, Opponent Quit Game Dialog appears. The player press "Quit Button" to call this method.
  ///
  /// Update player's status to idle and return to Home Online Page.
  void quitGameWhenOpponentQuited() {
    Get.back();
    Get.offAllNamed(Routes.HOME_ONLINE);
    Get.back();
    firestoreService.updateUserStatus(currentUser.uid, OnlineUserStatus.idle);
    update();
  }

  void handleSignOut() {
    final data = {
      'isOnline': false,
      'currentRoomId': '',
      'opponentId': '',
      'playerIndex': null,
      'status': OnlineUserStatus.offline.toShortString(),
    };
    firestoreService.updateUser(firebaseAuth.currentUser!.uid, data);
  }

  void handleSignIn(OnlineUser newUser) {
    final data = {
      'isOnline': true,
      'status': OnlineUserStatus.inWelcomePage.toShortString(),
    };
    firestoreService.updateUser(firebaseAuth.currentUser!.uid, data);
    currentUser = newUser;
  }

  void handleFromWelcomePageToOnlineHomePage() {
    final data = {
      'status': OnlineUserStatus.idle.toShortString(),
    };
    firestoreService.updateUser(firebaseAuth.currentUser!.uid, data);
  }

  void handleToWelcomePage() {
    final data = {
      'status': OnlineUserStatus.inWelcomePage.toShortString(),
    };
    firestoreService.updateUser(firebaseAuth.currentUser!.uid, data);
  }

  /// Update two users's opponent in Firebase.
  updateOpponentId() {
    firestoreService.updateUserOpponentId(currentUser.uid, opponentId);
    firestoreService.updateUserOpponentId(opponentId, currentUser.uid);
    update();
  }

  /// Remove two users's opponent and update user's status to idle in Firebase.
  removeOpponentForBothUsers() {
    final currentUserData = {
      'opponentId': '',
      'playerIndex': null,
      'status': OnlineUserStatus.idle.toShortString()
    };
    final opponentData = {
      'opponentId': '',
      'playerIndex': null,
      'status': OnlineUserStatus.idle.toShortString()
    };
    firestoreService.updateUser(currentUser.uid, currentUserData);
    firestoreService.updateUser(opponentId, opponentData);
    opponentId = '';
    opponent = null;
    update();
  }

  updateTwoUserOnFirebase(Map<String, dynamic> data) {
    firestoreService.updateUser(currentUser.uid, data);
    firestoreService.updateUser(opponentId, data);
}

  updateCurrentUserStatus(OnlineUserStatus status) {
    firestoreService.updateUserStatus(currentUser.uid, status);
    update();
  }
}