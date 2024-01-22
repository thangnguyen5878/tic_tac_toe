import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';
import 'package:get/get.dart';

class CreateRoomController extends GetxController {

  static CreateRoomController get to => Get.find();

  TextEditingController room = TextEditingController();
  TextEditingController player1 = TextEditingController();
  TextEditingController player2 = TextEditingController();
  TextEditingController rowCount = TextEditingController();
  TextEditingController columnCount = TextEditingController();

  clearInput() {
    room.clear();
    player1.clear();
    player2.clear();
    rowCount.clear();
    columnCount.clear();
    logger.t('input cleared');
    update();
  }
}
