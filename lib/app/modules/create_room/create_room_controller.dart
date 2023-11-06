import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateRoomController extends GetxController {

  static CreateRoomController get to => Get.find();

  TextEditingController room = TextEditingController();
  TextEditingController player1 = TextEditingController();
  TextEditingController player2 = TextEditingController();
  TextEditingController rowCount = TextEditingController();
  TextEditingController columnCount = TextEditingController();

  clear() {
    room.clear();
    player1.clear();
    player2.clear();
    rowCount.clear();
    columnCount.clear();
    print('input cleared');
    update();
  }
}
