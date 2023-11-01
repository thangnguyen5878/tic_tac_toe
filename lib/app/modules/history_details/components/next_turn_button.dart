// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:get/get.dart';

class NextTurnButton extends StatelessWidget {
  GameController gameController = Get.find<GameController>();

  NextTurnButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Press History Next Turn Button...');
        gameController.pauseHistoryAutoPlay();
        gameController.historyNextTurn();

      },
      style: TextButton.styleFrom(elevation: 1, backgroundColor: kBlue30),
      child: const Icon(Icons.chevron_right, color: Colors.black, size: 35),
    );
  }
}
