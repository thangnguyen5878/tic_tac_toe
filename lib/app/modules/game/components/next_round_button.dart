import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class NextRoundButton extends StatelessWidget {
  const NextRoundButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final room = GameController.to.room;

    return GetBuilder<GameController>(
      builder: (gameController) {
        if (room.isGameOver()) {
          return IconButton(
            icon: const Icon(
              Icons.forward,
              color: kBlack,
              size: kIconSize,
            ),
            onPressed: () async {
              GameController.to.nextRound();
              await GameController.to.saveRoom();
            },
          );
        }
        return Container();
      },
    );
  }
}
