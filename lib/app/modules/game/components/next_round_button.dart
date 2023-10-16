import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/game_state.dart';
import 'package:flutter_tic_tac_toe/values/app_colors.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class NextRoundButton extends StatelessWidget {
  const NextRoundButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
      builder: (game) {
        final isGameOver = game.room.state == GameState.stop;
        if (isGameOver) {
          return IconButton(
            icon: const Icon(
              Icons.forward,
              color: AppColors.black,
            ),
            onPressed: () {
              game.nextRound();
            },
          );
        }
        return Container();
      },
    );
  }
}