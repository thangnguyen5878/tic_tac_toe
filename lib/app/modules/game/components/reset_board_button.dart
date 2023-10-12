import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/values/app_colors.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ResetBoardButton extends StatelessWidget {
  const ResetBoardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
      builder: (gameController) {
        // final isGameOver = game.room.state == GameState.stop;
        return IconButton(
          icon: const Icon(
            Icons.refresh,
            
          ),
          onPressed: () {
            gameController.resetBoard();
            gameController.saveRoom();
          },
        );
      },
    );
  }
}
