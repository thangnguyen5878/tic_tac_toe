// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';

class HistoryPreviousTurnButton extends StatelessWidget {
  const HistoryPreviousTurnButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        logger.t('Press Previous Turn Button');
        if (isOffline) {
          GameController.to.pauseHistoryAutoPlay();
          GameController.to.goToPreviousTurnInHistory();
        }
      },
      style: TextButton.styleFrom(elevation: 1, backgroundColor: kBlue),
      child: const Icon(
        Icons.chevron_left,
        color: Colors.black,
        size: 35,
      ),
    );
  }
}
