
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/dialogs/challenge_dialog.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/dialogs/invited_dialog.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/dialogs/rejected_dialog.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/dialogs/waiting_dialog.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constant.dart';
import 'package:get/get.dart';

class OnlinePlayerController extends GetxController {
  static OnlinePlayerController to = Get.find();

  String currentPlayerId = '';
  String opponentId = '';

  @override
  void onReady() {
    super.onReady();
    _listenForPlayerStatus();
  }

  void _listenForPlayerStatus()  {
    // listen for current Player
    FirebaseFirestore.instance
        .collection("players")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        final status = snapshot.data()!["status"];
        opponentId = snapshot.data()!['opponentId'];
        currentPlayerId = snapshot.data()!['uid'];
        if (status == 'waiting') {
          Get.dialog(WaitingDialog(), barrierDismissible: false);
        }
        if (status == "invited") {
          Get.dialog(
            InvitedDialog(),
            barrierDismissible: false
          );
        }
        if (status == "waiting canceled") {
          Get.back();
          firestoreService.updatePlayerStatus(opponentId, 'idle');
        }
        if (status == 'rejected') {
          Get.back();
          Get.dialog(RejectedDialog(), barrierDismissible: false);
        }
        if (status == "in game") {
          Get.offNamed(Routes.ONLINE_GAME);
        }
      }
    }
    );
    update();
  }

  void startChallengeAnotherPlayer()  {
    updateOpponentId();
    firestoreService.updatePlayerStatus(currentPlayerId, 'waiting');
    firestoreService.updatePlayerStatus(opponentId, 'invited');
    Get.back();
    update();
  }

  void acceptTheChallenge()  {
    firestoreService.updatePlayerStatus(currentPlayerId, 'in game');
    firestoreService.updatePlayerStatus(opponentId, 'in game');
    update();
  }

  void rejectTheChallenge()  {
    firestoreService.updatePlayerStatus(currentPlayerId, 'idle');
    firestoreService.updatePlayerStatus(opponentId, 'rejected');
    removeOpponent();
    update();
  }

  void selectOpponent(String uid)  {
    opponentId = uid;
    Get.dialog(
        ChallengeDialog(), barrierDismissible: false
    );
    update();
  }

  void cancelWaiting()  {
    firestoreService.updatePlayerStatus(currentPlayerId, 'idle');
    firestoreService.updatePlayerStatus(opponentId, 'waiting canceled');
    removeOpponent();
    Get.back();
    update();
  }

  /// Update two players's opponent in Firebase.
  updateOpponentId()  {
    firestoreService.updateOpponent(currentPlayerId, opponentId);
    firestoreService.updateOpponent(opponentId, currentPlayerId);
    update();
  }

  /// Remove two players's opponent and update player's status to idle in Firebase.
  removeOpponent()  {
    firestoreService.updateOpponent(currentPlayerId, '');
    firestoreService.updateOpponent(opponentId, '');
    firestoreService.updatePlayerStatus(currentPlayerId, 'idle');
    firestoreService.updatePlayerStatus(opponentId, 'idle');
    update();
  }
}