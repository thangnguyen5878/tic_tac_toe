import 'package:flutter_tic_tac_toe/models/online/online_user.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/dialogs/challenge_dialog.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/dialogs/invited_dialog.dart';
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
  late OnlineUser opponent;
  // final String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';
  OnlineUserStatus oldCurrentUserStatus = OnlineUserStatus.idle;
  String opponentId = '';
  // OnlineUserStatus? opponentStatus;

  @override
  void onReady() {
    super.onReady();
    _listenForUserStatus();
  }

  void _listenForUserStatus() {
    // listen for current user
    firestoreService.watchCurrentUser().listen((snapshot) {
      if (snapshot.exists) {
        currentUser = snapshot.data() as OnlineUser;
        opponentId = currentUser.opponentId;
        // debugPrint('status is $status');
        switch (currentUser.status) {
          case OnlineUserStatus.idle:
            oldCurrentUserStatus = OnlineUserStatus.idle;
            break;
          case OnlineUserStatus.waitingForInvitation:
            if (oldCurrentUserStatus != OnlineUserStatus.waitingForInvitation) {
              Get.back();
              Get.dialog(WaitingDialog(), barrierDismissible: false);
            }
            oldCurrentUserStatus = OnlineUserStatus.waitingForInvitation;
            break;
          case OnlineUserStatus.invited:
            if (oldCurrentUserStatus != OnlineUserStatus.invited) {
              Get.back();
              Get.dialog(InvitedDialog(), barrierDismissible: false);
            }
            oldCurrentUserStatus = OnlineUserStatus.invited;
            break;
          case OnlineUserStatus.waitingCanceled:
            if (oldCurrentUserStatus != OnlineUserStatus.waitingCanceled) {
              Get.back();
              firestoreService.updateUserStatus(
                  opponentId, OnlineUserStatus.idle);
            }
            oldCurrentUserStatus = OnlineUserStatus.waitingCanceled;
            break;
          case OnlineUserStatus.invitationRejected:
            if (oldCurrentUserStatus != OnlineUserStatus.invitationRejected) {
              Get.back();
              Get.dialog(RejectedDialog(), barrierDismissible: false);
            }
            oldCurrentUserStatus = OnlineUserStatus.invitationRejected;
            break;
          case OnlineUserStatus.inGame:
            Get.offNamed(Routes.ONLINE_GAME);
            oldCurrentUserStatus = OnlineUserStatus.inGame;
            break;
          case OnlineUserStatus.opponentQuitted:
            if (oldCurrentUserStatus != OnlineUserStatus.opponentQuitted) {
              Get.until((route) => !Get.isDialogOpen!);
              Get.dialog(OpponentQuitGameDialog(), barrierDismissible: false);
            }
            oldCurrentUserStatus = OnlineUserStatus.opponentQuitted;
            break;
          default:
            break;
        }
      }
    });
    update();
  }

  void quitGame() {
    if (oldCurrentUserStatus == OnlineUserStatus.opponentQuitted) {
      quitGameWhenOpponentQuited();
    }
    else {
      Get.dialog(QuitGameDialog(), barrierDismissible: false);
    }
  }

  void startChallengeAnotherUser() {
    firestoreService.updateUserOpponentId(currentUser.uid, opponentId);
    firestoreService.updateUserOpponentId(opponentId, currentUser.uid);
    firestoreService.updateUserStatus(currentUser.uid, OnlineUserStatus.waitingForInvitation);
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.invited);
    update();
  }

  void acceptChallenge() {
    firestoreService.updateUserStatus(currentUser.uid, OnlineUserStatus.inGame);
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.inGame);
    update();
  }

  void rejectInvitation() {
    Get.back();
    firestoreService.updateUserStatus(currentUser.uid, OnlineUserStatus.idle);
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.invitationRejected);
    removeOpponent();
    update();
  }

  void selectOpponent(String uid)  {
    Get.dialog(ChallengeDialog(), barrierDismissible: false);
    opponentId = uid;
    update();
  }

  void cancelWaiting() {
    Get.back();
    removeOpponent();
    firestoreService.updateUserStatus(currentUser.uid, OnlineUserStatus.idle);
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.waitingCanceled);
    update();
  }

  /// This method is called when a player quit the game (press "Quit Button" on Quit Game Dialog).
  void quitGameSuddenly() {
    Get.offNamed(Routes.HOME_ONLINE);
    firestoreService.updateUserStatus(currentUser.uid, OnlineUserStatus.idle);
    firestoreService.updateUserOpponentId(currentUser.uid, '');
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.opponentQuitted);
    update();
  }

  /// When the opponent left the game, Opponent Quit Game Dialog appears. The player press "Quit Button" to call this method.
  ///
  /// Update player's status to idle and return to Home Online Page.
  void quitGameWhenOpponentQuited() {
    Get.back();
    Get.offAllNamed(Routes.HOME_ONLINE);
    Get.back();
    firestoreService.updateUserOpponentId(currentUser.uid, '');
    firestoreService.updateUserStatus(currentUser.uid, OnlineUserStatus.idle);
    update();
  }

  /// Update two users's opponent in Firebase.
  updateOpponentId() {
    firestoreService.updateUserOpponentId(currentUser.uid, opponentId);
    firestoreService.updateUserOpponentId(opponentId, currentUser.uid);
    update();
  }

  /// Remove two users's opponent and update user's status to idle in Firebase.
  removeOpponent()  {
    firestoreService.updateUserOpponentId(currentUser.uid, '');
    firestoreService.updateUserOpponentId(opponentId, '');
    firestoreService.updateUserStatus(currentUser.uid, OnlineUserStatus.idle);
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.idle);
    opponentId = '';
    update();
  }

  updateCurrentUserStatus(OnlineUserStatus status) {
    firestoreService.updateUserStatus(currentUser.uid, status);
    update();
  }
}