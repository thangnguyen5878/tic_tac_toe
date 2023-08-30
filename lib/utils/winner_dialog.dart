import 'package:tic_tac_toe/controllers/table_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showWinnerDialog(String winner) {
  print('show winner dialog');
  Get.defaultDialog(
    title: 'Result',
    content: Text('WINNER is $winner'),
    actions: [
      // Play Again Button: remomve dialog and clear the board
      TextButton(
        onPressed: () {
          Get.back();
          print('play again');
          TableController.to.emptyXOList();
          // TableController.to.clearInput();
        },
        child: const Text("Play Again"),
      ),
      // Back button: back to input page
      TextButton(
        onPressed: () {
          Get.back();
          Get.back();
          print('back to input page');
          TableController.to.emptyXOList();
          TableController.to.clearInput();
        },
        child: const Text("Back"),
      ),
    ],
  );
}
