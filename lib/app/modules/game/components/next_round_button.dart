import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/enums/game_state.dart';
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
            icon: Icon(
              Icons.forward,
              color: kBlack,
              size: kIconSize,
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
