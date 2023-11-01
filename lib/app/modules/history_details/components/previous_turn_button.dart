// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:get/get.dart';

class PreviousTurnButton extends StatelessWidget {
  GameController gameController = Get.find<GameController>();

  PreviousTurnButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Icon(
        Icons.chevron_left,
        color: Colors.black,
        size: 35,
      ),
      onPressed: () {
        print('Press Previous Next Turn Button...');
        gameController.pauseHistoryAutoPlay();
        gameController.historyPreviousTurn();
      },
      style: TextButton.styleFrom(elevation: 1, backgroundColor: kBlue30),
    );
  }
}
