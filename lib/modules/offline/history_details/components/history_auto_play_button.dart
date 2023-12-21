import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:get/get.dart';

class HistoryAutoPlayButton extends StatelessWidget {
  HistoryAutoPlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(builder: (gameController) {
      IconData icon = GameController.to.isHistoryAutoPlay == false
          ? Icons.play_arrow
          : Icons.pause;

      return ElevatedButton(
        onPressed: () {
          GameController.to.toggleHistoryAutoPlay();
        },
        style: TextButton.styleFrom(elevation: 1, backgroundColor: kPurple30),
        child: Icon(icon, color: Colors.black, size: 35),
      );
    });
  }
}