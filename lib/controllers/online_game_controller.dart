import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:get/get.dart';

class OnlineGameController extends GetxController {
  static OnlineGameController to = Get.find();

  String receiverPlayerId = '';
  String challengeStatus = '';

  void challengePlayer(String playerId) {
    this.receiverPlayerId = playerId;
    this.challengeStatus = 'sent';

    FirebaseFirestore.instance
        .collection('players')
        .doc(playerId)
        .update({
      'challengeStatus': 'received',
    });
    update();
  }

  void onChallengeResponse(String response) {
    if (response == 'accept') {
      // Chuyển sang trang chơi game
      Get.toNamed(Routes.ONLINE_GAME);
    } else if (response == 'cancel') {
      // Thông báo người chơi 1
      this.challengeStatus = 'đã hủy';
    }
  }


}
