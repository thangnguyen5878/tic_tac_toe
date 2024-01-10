// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class PreviousTurnButton extends StatelessWidget {
  const PreviousTurnButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        logger.t('Press Previous Next Turn Button...');
        GameController.to.pauseHistoryAutoPlay();
        GameController.to.historyPreviousTurn();
      },
      style: TextButton.styleFrom(elevation: 1, backgroundColor: kBlue30),
      child: const Icon(
        Icons.chevron_left,
        color: Colors.black,
        size: 35,
      ),
    );
  }
}
