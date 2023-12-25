import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  String currentUserId = FirebaseAuth.instance.currentUser!.uid;
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
        debugPrint('status is $status');
        if(status == OnlineUserStatus.idle.toShortString()) {
          currentUserStatus = OnlineUserStatus.idle.toShortString();
        }
        if (status == OnlineUserStatus.waitingForInvitation.toShortString() && status == currentUserStatus) {
          Get.back();
          Get.dialog(WaitingDialog(), barrierDismissible: false);
          currentUserStatus = OnlineUserStatus.waitingForInvitation.toShortString();
        }
        if (status == OnlineUserStatus.invited.toShortString() && status != currentUserStatus) {
          Get.back();
          Get.dialog(InvitedDialog(), barrierDismissible: false);
          currentUserStatus = OnlineUserStatus.invited.toShortString();
        }
        if (status == OnlineUserStatus.waitingCanceled.toShortString()
            && status != currentUserStatus) {
          Get.back();
          firestoreService.updateUserStatus(opponentId, OnlineUserStatus.idle.toShortString());
          currentUserStatus = OnlineUserStatus.waitingCanceled.toShortString();
        }
        if (status == OnlineUserStatus.invitationRejected.toShortString() && status != currentUserStatus) {
          Get.back();
          print('status: $status');
          print('currentUserStatus: $currentUserStatus');
          // print('show rejected dialog...');
          Get.dialog(RejectedDialog(), barrierDismissible: false);
          currentUserStatus = OnlineUserStatus.invitationRejected.toShortString();
        }
        if (status == OnlineUserStatus.inGame.toShortString()) {
          Get.offNamed(Routes.ONLINE_GAME);
          currentUserStatus = OnlineUserStatus.inGame.toShortString();
        }
        // When the opponent quit the game, show Opponent Quit Game Dialog.
        if (status == OnlineUserStatus.opponentQuitted.toShortString() && status != currentUserStatus) {
          print('status: $status');
          print('currentUserStatus: $currentUserStatus');
          // print('show opponent quit game dialog...');
          Get.until((route) => !Get.isDialogOpen!);
          Get.dialog(OpponentQuitGameDialog(), barrierDismissible: false);
          currentUserStatus = OnlineUserStatus.opponentQuitted.toShortString();
        }
      }
      // Future.delayed(Duration(milliseconds: 1000));
    });
    update();
  }

  void quitGame() {
    if (currentUserStatus == OnlineUserStatus.opponentQuitted.toShortString()) {
      quitGameWhenOpponentQuited();
    }
    else {
      Get.dialog(QuitGameDialog(), barrierDismissible: false);
    }
  }

  void startChallengeAnotherUser() {
    // Get.back();
    debugPrint('current user id: $currentUserId');
    debugPrint('opponent id: $opponentId');

    firestoreService.updateUserOpponentId(currentUserId, opponentId);
    firestoreService.updateUserOpponentId(opponentId, currentUserId);
    firestoreService.updateUserStatus(currentUserId, OnlineUserStatus.waitingForInvitation.toShortString());
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.invited.toShortString());
    update();
  }

  void acceptChallenge() {
    firestoreService.updateUserStatus(currentUserId, OnlineUserStatus.inGame.toShortString());
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.inGame.toShortString());
    update();
  }

  void rejectChallenge() {
    Get.back();
    firestoreService.updateUserStatus(currentUserId, OnlineUserStatus.idle.toShortString());
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.invitationRejected.toShortString());
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
    firestoreService.updateUserStatus(currentUserId, OnlineUserStatus.idle.toShortString());
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.waitingCanceled.toShortString());
    update();
  }

  /// This method is called when a player quit the game (press "Quit Button" on Quit Game Dialog).
  void quitGameSuddenly() {
    Get.offNamed(Routes.HOME_ONLINE);
    firestoreService.updateUserStatus(currentUserId, OnlineUserStatus.idle.toShortString());
    firestoreService.updateUserOpponentId(currentUserId, '');
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.opponentQuitted.toShortString());
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
    firestoreService.updateUserOpponentId(currentUserId, '');
    firestoreService.updateUserStatus(currentUserId, OnlineUserStatus.idle.toShortString());
    update();
  }

  /// Update two users's opponent in Firebase.
  updateOpponentId() {
    firestoreService.updateUserOpponentId(currentUserId, opponentId);
    firestoreService.updateUserOpponentId(opponentId, currentUserId);
    update();
  }

  /// Remove two users's opponent and update user's status to idle in Firebase.
  removeOpponent()  {
    firestoreService.updateUserOpponentId(currentUserId, '');
    firestoreService.updateUserOpponentId(opponentId, '');
    firestoreService.updateUserStatus(currentUserId, OnlineUserStatus.idle.toShortString());
    firestoreService.updateUserStatus(opponentId, OnlineUserStatus.idle.toShortString());
    opponentId = '';
    update();
  }

  updateCurrentUserStatus(String status) {
    firestoreService.updateUserStatus(currentUserId, status);
    update();
  }
}