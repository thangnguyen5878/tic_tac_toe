import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/dialogs/challenge_dialog.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/dialogs/invited_dialog.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/dialogs/rejected_dialog.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/dialogs/waiting_dialog.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_game/components/dialogs/opponent_quit_game_dialog.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_game/components/dialogs/quit_game_dialog.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constant.dart';
import 'package:get/get.dart';

class OnlineUserController extends GetxController {

  static OnlineUserController to = Get.find();

  String currentUserId = '';
  String currentUserStatus = '';
  String opponentId = '';
  String opponentStatus = '';

  @override
  void onReady() {
    super.onReady();
    _listenForUserStatus();
  }

  void _listenForUserStatus() {
    // listen for current user
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        final status = snapshot.data()!["status"];
        opponentId = snapshot.data()!['opponentId'];
        currentUserId = snapshot.data()!['uid'];
        if(status == 'idle') {
          currentUserStatus = 'idle';
        }
        if (status == 'waiting' && status == currentUserStatus) {
          Get.back();
          Get.dialog(WaitingDialog(), barrierDismissible: false);
          print('show waiting dialog...');
          currentUserStatus = 'waiting';
        }
        if (status == "invited" && status != currentUserStatus) {
          Get.back();
          print('status: $status');
          print('currentUserStatus: $currentUserStatus');
          // print('show invited dialog...');
          Get.dialog(InvitedDialog(), barrierDismissible: false);
          currentUserStatus = 'invited';
        }
        if (status == "waiting canceled" && status != currentUserStatus) {
          Get.back();
          firestoreService.updateUserStatus(opponentId, 'idle');
          currentUserStatus = 'waiting canceled';
        }
        if (status == 'rejected' && status != currentUserStatus) {
          Get.back();
          print('status: $status');
          print('currentUserStatus: $currentUserStatus');
          // print('show rejected dialog...');
          Get.dialog(RejectedDialog(), barrierDismissible: false);
          currentUserStatus = 'rejected';
        }
        if (status == "in game") {
          Get.offNamed(Routes.ONLINE_GAME);
          currentUserStatus = 'in game';
        }
        // When the opponent quit the game, show Opponent Quit Game Dialog.
        if (status == 'opponent quit game' && status != currentUserStatus) {
          print('status: $status');
          print('currentUserStatus: $currentUserStatus');
          // print('show opponent quit game dialog...');
          Get.until((route) => !Get.isDialogOpen!);
          Get.dialog(OpponentQuitGameDialog(), barrierDismissible: false);
          currentUserStatus = 'opponent quit game';
        }
      }
      // Future.delayed(Duration(milliseconds: 1000));
    });
    update();
  }

  void quitGame() {
    if (currentUserStatus == 'opponent quit game') {
      quitGameWhenOpponentQuited();
    }
    else {
      Get.dialog(QuitGameDialog(), barrierDismissible: false);
    }
  }

  void startChallengeAnotherUser() {
    // Get.back();
    firestoreService.updateOpponent(currentUserId, opponentId);
    firestoreService.updateOpponent(opponentId, currentUserId);
    firestoreService.updateUserStatus(currentUserId, 'waiting');
    firestoreService.updateUserStatus(opponentId, 'invited');
    update();
  }

  void acceptChallenge() {
    firestoreService.updateUserStatus(currentUserId, 'in game');
    firestoreService.updateUserStatus(opponentId, 'in game');
    update();
  }

  void rejectChallenge() {
    Get.back();
    firestoreService.updateUserStatus(currentUserId, 'idle');
    firestoreService.updateUserStatus(opponentId, 'rejected');
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
    firestoreService.updateUserStatus(currentUserId, 'idle');
    firestoreService.updateUserStatus(opponentId, 'waiting canceled');
    update();
  }

  /// This method is called when a player quit the game (press "Quit Button" on Quit Game Dialog).
  void quitGameSuddenly() {
    Get.offNamed(Routes.HOME_ONLINE);
    firestoreService.updateUserStatus(currentUserId, 'idle');
    firestoreService.updateOpponent(currentUserId, '');
    firestoreService.updateUserStatus(opponentId, 'opponent quit game');
    update();
  }

  /// When the opponent left the game, Opponent Quit Game Dialog appears. The player press "Quit Button" to call this method.
  ///
  /// Update player's status to idle and return to Home Online Page.
  void quitGameWhenOpponentQuited() {
    Get.back();
    Get.offAllNamed(Routes.HOME_ONLINE);
    Get.back();
    // Get.back();
    firestoreService.updateOpponent(currentUserId, '');
    firestoreService.updateUserStatus(currentUserId, 'idle');
    update();
  }

  /// Update two users's opponent in Firebase.
  updateOpponentId() {
    firestoreService.updateOpponent(currentUserId, opponentId);
    firestoreService.updateOpponent(opponentId, currentUserId);
    update();
  }

  /// Remove two users's opponent and update user's status to idle in Firebase.
  removeOpponent()  {
    firestoreService.updateOpponent(currentUserId, '');
    firestoreService.updateOpponent(opponentId, '');
    firestoreService.updateUserStatus(currentUserId, 'idle');
    firestoreService.updateUserStatus(opponentId, 'idle');
    opponentId = '';
    update();
  }

  updateCurrentUserStatus(String status) {
    currentUserStatus = status;
    firestoreService.updateUserStatus(currentUserStatus, status);
    update();
  }
}