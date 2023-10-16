import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/seed.dart';
import 'package:flutter_tic_tac_toe/values/app_colors.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class PlayerBottomBar extends StatelessWidget {
  const PlayerBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 48,
      child: GetBuilder(builder: (GameController game) {
        final currentPlayer = game.room.currentRound.currentPlayer;
        final player1 = game.room.currentRound.players![0];
        final player2 = game.room.currentRound.players![1];

        final xColor = currentPlayer!.seed == Seed.cross
            ? AppColors.black
            : AppColors.grey45;
        final oColor = currentPlayer.seed == Seed.nought
            ? AppColors.black
            : AppColors.grey45;
        final xBoxColor = currentPlayer.seed == Seed.cross
            ? AppColors.brown30
            : AppColors.grey30;
        final oBoxColor = currentPlayer.seed == Seed.nought
            ? AppColors.brown30
            : AppColors.grey30;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Player 1 Box
            Expanded(
              child: Container(
                color: xBoxColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${player1.name}: X',
                      style:
                          TextStyle(color: xColor, fontWeight: FontWeight.bold),
                    ),
                    Text('Score: ${player1.score}',
                        style: TextStyle(
                            color: xColor, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            // Player 2 Box
            Expanded(
              child: Container(
                color: oBoxColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${player2.name}: O',
                      style:
                          TextStyle(color: oColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Score: ${player2.score}',
                      style:
                          TextStyle(color: oColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
