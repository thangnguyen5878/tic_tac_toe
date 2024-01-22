// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class HistoryNextTurnButton extends StatelessWidget {
  const HistoryNextTurnButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        logger.t('Press History next turn button');
        if (isOffline) {
          GameController.to.pauseHistoryAutoPlay();
          GameController.to.goToNextTurnInHistory();
        }
      },
      style: TextButton.styleFrom(elevation: 1, backgroundColor: kBlue),
      child: const Icon(Icons.chevron_right, color: Colors.black, size: 35),
    );
  }
}
