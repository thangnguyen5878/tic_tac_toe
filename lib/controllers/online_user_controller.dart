import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/challenge_dialog.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/invitation_dialog.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/invitation_timeout_dialog.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/online_loser_dialog.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/online_winner_dialog.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/opponent_quit_game_dialog.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/quit_game_dialog.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/rejected_dialog.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/rematch_dialog.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/rematch_waiting_dialog.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/waiting_dialog.dart';
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/models/online_user.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/online_user_status.dart';
import 'package:get/get.dart';

import '../utils/constants/constants.dart';

class OnlineUserController extends GetxController {
  static OnlineUserController to = Get.find();

  late OnlineUser currentUser;
  OnlineUser? opponent;
  OnlineUserStatus oldCurrentUserStatus = OnlineUserStatus.idle;
  String opponentId = '';

  @override
  void onReady() {
    super.onReady();
    _initializeUserFirestoreListeners();
  }

  /// Initializes listeners for real-time updates on the current user and opponent's data from Firestore.
  void _initializeUserFirestoreListeners() {
    // Listen for changes to the current user's data:
    firestoreService.watchUser(FirebaseAuth.instance.currentUser?.uid ?? '').listen((snapshot) {
      if (snapshot.exists) {
        logger.t('Updating current user data from Firestore');
        currentUser = snapshot.data() as OnlineUser;
        opponentId = currentUser.opponentId;
        _initializeOpponentListener();
        _handleUserStatus();
      }
    });
    update();
  }

  /// Initializes a listener to watch for changes to the opponent's data.
  void _initializeOpponentListener() async {
    firestoreService.watchUser(currentUser.opponentId).listen((snapshot) {
      opponent = snapshot.data() as OnlineUser;
    });
  }

  /// Handles changes in the current user's status, triggering appropriate actions and UI updates.
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
        case OnlineUserStatus.win:
          _handleWinStatus();
          break;
        case OnlineUserStatus.lose:
          _handleLoseStatus();
          break;
        case OnlineUserStatus.rematchPending:
          _handleRematchWaitingStatus();
          break;
        default:
          break;
      }

      // Update the tracked status for future comparisons
      oldCurrentUserStatus = currentUser.status;
    }
  }

  void _handleRematchWaitingStatus() {
    logger.t('handle user status: rematch waiting');
    Get.back();
    Get.dialog(const RematchWaitingDialog(), barrierDismissible: false);
  }

  Future<void> _handleWinStatus() async {
    logger.t('handle user status: win');
    await Future.delayed(const Duration(seconds: 2));
    logger.t('handle user status: win');
    Get.dialog(const OnlineWinnerDialog(), barrierDismissible: false);
  }

  Future<void> _handleLoseStatus() async {
    logger.t('handle user status: lose');
    await Future.delayed(const Duration(seconds: 2));
    Get.dialog(const OnlineLoserDialog(), barrierDismissible: false);
  }

  void _handleIdleStatus() {
    // handle idle status
  }

  void _handleWaitingForInvitationStatus() {
    logger.t('handle user status: waiting for invitation');
    Get.back();
    Get.dialog(const WaitingDialog(), barrierDismissible: false);
  }

  void _handleInvitedStatus() {
    logger.t('handle user status: invited');
    Get.back();
    Get.dialog(const InvitationDialog(), barrierDismissible: false);
  }

  void _handleInvitationWaitingCanceledStatus() {
    logger.t('handle user status: invitation waiting canceled');
    Get.back();
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.idle);
  }

  void _handleInvitationRejectedStatus() {
    logger.t('handle user status: invitation rejected');
    Get.back();
    Get.dialog(const RejectedDialog(), barrierDismissible: false);
  }

  void _handleInGameStatus() async {
    logger.t('handle user status: in game');
    Get.until((route) => !Get.isDialogOpen!);
    OnlineGameController.to.currentRoomId = currentUser.currentRoomId;
    OnlineGameController.to.pullRoomFromFirebase();
    Get.offNamed(Routes.ONLINE_GAME);
  }

  void _handleOpponentQuittedStatus() {
    logger.t('handle user status: opponent quitted');
    Get.until((route) => !Get.isDialogOpen!);
    Get.dialog(const OpponentQuitGameDialog(), barrierDismissible: false);
  }

  void _handleInvitationWaitingTimeoutStatus() {
    logger.t('handle user status: invitation waiting timeout');
    Get.back();
    Get.dialog(const InvitationTimeoutDialog(), barrierDismissible: false);
    updateCurrentUserStatus(OnlineUserStatus.idle);
  }

  void _handleInvitedButNoRespondStatus() {
    logger.t('handle user status: invited but no respond');
    Get.until((route) => !Get.isDialogOpen!);
    updateCurrentUserStatus(OnlineUserStatus.idle);
  }

  /// Handles the process of quitting the game when the back button is pressed on the OnlineGamePage.
  ///
  /// Differentiates between scenarios where the opponent has already quit and scenarios where the
  /// current user is initiating the quit process.
  void handleBackButtonOnGamePage() {
    logger.t('Handling back button on OnlineGamePage');

    if (oldCurrentUserStatus == OnlineUserStatus.opponentQuitted) {
      // Opponent has already quit, confirm quitting and clean up.
      quitGameWhenOpponentQuitted();
    } else {
      // Initiate the quit process by displaying a confirmation dialog.
      Get.dialog(
        const QuitGameDialog(),
        barrierDismissible: false,
      );
    }
  }

  /// Cancels a pending invitation, resetting statuses and clearing the opponent relationship.
  ///
  /// Called when the "Cancel Button" is pressed on the Invitation Waiting Dialog.
  void cancelInvitationWaiting() {
    logger.t('Canceling invitation waiting');
    firestoreService.updateUserStatus(currentUser.uid, OnlineUserStatus.invitaionWaitingCanceled);
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.invitaionWaitingCanceled);
    clearOpponentRelationshipAndResetStatuses();
    update();
  }

  /// Handles the situation when invitation times out without a respond.
  /// Called when the timer on [WaitingDialog] reaches 0s.
  void handleInvitationTimeout() {
    logger.t('handle invitation timeout');
    firestoreService.updateUserStatus(currentUser.uid, OnlineUserStatus.invitationWaitingTimeout);
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.invitedButNoRespond);
    clearOpponentRelationshipAndResetStatuses();
    update();
  }

  /// Handles the process of challenging another user.
  /// Called when the "Start Button" is pressed on [ChallengeDialog].
  void challengeAnotherUser() {
    logger.t('handle challenge another user');
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

  /// Accepts a challenge from an opponent, setting up the game environment and transitioning to the game.
  /// Called when the "Accept Button" is pressed on [InvitationDialog].
  void acceptChallengeFromOpponent() {
    logger.t('accept challenge from opponent');
    OnlineGameController.to
        .createRoom(OnlineUserController.to.currentUser.uid, OnlineUserController.to.opponentId);
    OnlineGameController.to.pushRoomToFirebase();
    final currentUserData = {
      'status': OnlineUserStatus.inGame.toShortString(),
      'currentRoomId': OnlineGameController.to.room.id
    };
    final opponentData = {
      'status': OnlineUserStatus.inGame.toShortString(),
      'currentRoomId': OnlineGameController.to.room.id
    };
    firestoreService.updateUser(currentUser.uid, currentUserData);
    firestoreService.updateUser(opponentId, opponentData);
    update();
  }

  /// Rejects an incoming game invitation, updating statuses and clearing the opponent relationship.
  /// Called when the "Reject Button" is press on [InvitationDialog].
  void rejectInvitation() {
    logger.t('reject invitation');
    Get.back();
    firestoreService.updateUserStatus(currentUser.uid, OnlineUserStatus.idle);
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.invitationRejected);
    clearOpponentRelationshipAndResetStatuses();
    update();
  }

  /// Initiates the challenge process with a selected opponent.
  ///
  /// Displays the ChallengeDialog to confirm the challenge and sets up initial data.
  void initiateChallenge(OnlineUser user) {
    logger.t('select opponent');
    Get.dialog(const ChallengeDialog(), barrierDismissible: false);
    opponent = user;
    opponentId = user.uid;
    update();
  }

  /// Handles the process of a player quitting the game suddenly.
  /// Called when the "Quit Button" is pressed on the Quit Game Dialog.
  void quitGameSuddenly() {
    logger.t('quit game suddenly');
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
    Get.offNamed(Routes.ONLINE_WAITING_ROOM);
    firestoreService.updateUser(currentUser.uid, currentUserData);
    firestoreService.updateUser(opponentId, opponentData);
    update();
  }

  /// Handles the process of quitting the game when the opponent has already left.
  /// Called when the "Quit Button" is pressed on the Opponent Quit Game Dialog.
  void quitGameWhenOpponentQuitted() {
    logger.t('quit game when opponent quited');
    Get.back();
    Get.offAllNamed(Routes.ONLINE_WAITING_ROOM);
    Get.back();
    firestoreService.updateUserStatus(currentUser.uid, OnlineUserStatus.idle);
    update();
  }

  /// Updates user data on Firestore when signing out.
  void handleSignOut() {
    logger.t('online user controller: handle sign out');
    final data = {
      'isOnline': false,
      'currentRoomId': '',
      'opponentId': '',
      'playerIndex': null,
      'status': OnlineUserStatus.offline.toShortString(),
    };
    firestoreService.updateUser(firebaseAuth.currentUser!.uid, data);
  }

  /// Updates user data when signing in.
  void handleSignIn(OnlineUser newUser) {
    logger.t('online user controller: handle sign in');
    firestoreService.addUser(newUser);
    currentUser = newUser;
    update();
  }

  void updateUserStatusToIdle() {
    final data = {
      'status': OnlineUserStatus.idle.toShortString(),
    };
    firestoreService.updateUser(firebaseAuth.currentUser!.uid, data);
  }

  void updateUserStatusToInWelcomePage() {
    final data = {
      'status': OnlineUserStatus.inWelcomePage.toShortString(),
    };
    firestoreService.updateUser(firebaseAuth.currentUser!.uid, data);
  }

  /// Establishes the opponent relationship between two users in Firestore.
  ///
  /// Updates the `opponentId` fields for both users to reflect their connection.
  void establishOpponentRelationship() {
    firestoreService.updateUserOpponentId(currentUser.uid, opponentId);
    firestoreService.updateUserOpponentId(opponentId, currentUser.uid);
    update();
  }

  /// Terminates the opponent relationship between two users in Firestore and sets their statuses to idle.
  ///
  /// Clears opponent IDs, player indices, and sets statuses to idle, indicating they're available for new games.
  void clearOpponentRelationshipAndResetStatuses() {
    final currentUserData = {
      'opponentId': '',
      'playerIndex': null,
      'status': OnlineUserStatus.idle.toShortString(),
    };
    final opponentData = {
      'opponentId': '',
      'playerIndex': null,
      'status': OnlineUserStatus.idle.toShortString(),
    };

    firestoreService.updateUser(currentUser.uid, currentUserData);
    firestoreService.updateUser(opponentId, opponentData);

    opponentId = '';
    opponent = null;

    update();
  }

  void updateTwoUserOnFirebase(Map<String, dynamic> data) {
    firestoreService.updateUser(currentUser.uid, data);
    firestoreService.updateUser(opponentId, data);
  }

  void updateCurrentUserStatus(OnlineUserStatus status) {
    firestoreService.updateUserStatus(currentUser.uid, status);
    update();
  }

  /// Updates the winner and loser statuses in Firestore based on the current round's outcome.
  void updateWinnerAndLoserStatus() {
    logger.t('update winner and loser status');
    final winnerIndex = OnlineGameController.to.room.getCurrentRound().winnerIndex;
    // The player who draws the last seed win the game.
    if (currentUser.playerIndex == winnerIndex) {
      final currentUserData = {'status': OnlineUserStatus.win.toShortString()};
      // The another player is the loser.
      final opponentData = {'status': OnlineUserStatus.lose.toShortString()};
      firestoreService.updateUser(currentUser.uid, currentUserData);
      firestoreService.updateUser(opponentId, opponentData);
    }
  }

  void requestOpponentForReplay() {
    final currentUserData = {
      'status': OnlineUserStatus.rematchPending.toShortString(),
    };
    firestoreService.updateUser(currentUser.uid, currentUserData);
  }

  /// If there are no player in the current room has rematch pending status
  /// then, show [RematchWaitingDialog].
  /// Else, show [RematchDialog].
  void handlePressRematchButtonOnAppbar() {
    Get.dialog(const RematchDialog(), barrierDismissible: false);
  }

  Future<void> handlePressRematchButtonOnDialog() async {
    OnlineUserController.to.updateCurrentUserStatus(OnlineUserStatus.rematchPending);
    if (await hasRematchPendingUser(1)) {
      Get.until((route) => !Get.isDialogOpen!);
      Get.dialog(const RematchWaitingDialog(), barrierDismissible: false);
    }
    if (await hasRematchPendingUser(2)) {
      OnlineGameController.to.nextRound();
    }
  }

  Future<bool> hasRematchPendingUser(int num) async {
    QuerySnapshot result =
        await firestoreService.getUsersInARoomWithRematchPendingStatus(currentUser.currentRoomId);
    return result.docs.length == num;
  }

  void handleRematchWaitingCancelation() {
    Get.until((route) => !Get.isDialogOpen!);
    OnlineUserController.to.updateCurrentUserStatus(OnlineUserStatus.roundCompleted);
  }
}
