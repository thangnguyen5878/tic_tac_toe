import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/models/online/online_room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constant.dart';
import 'package:get/get.dart';

class OnlineGameController extends GetxController {
  static OnlineGameController to = Get.find();
  OnlineRoom room = OnlineRoom();

  createRoom() {
    firestoreService.addRoom(room);
    debugPrint('room created in firestore');
    print(room.toJson());
    update();
  }
}
