import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
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
      child: GetBuilder(builder: (GameController gameController) {
        final room = gameController.room;
        final round = room.rounds![room.currentRoundIndex];
        final currentPlayer = round!.players![round.currentPlayerIndex!];
        final player1 = round!.players![0];
        final player2 = round!.players![1];;

        final xColor = currentPlayer!.seed == Seed.cross ? kBlack : kGrey45;
        final oColor = currentPlayer.seed == Seed.nought ? kBlack : kGrey45;
        final xBoxColor = currentPlayer.seed == Seed.cross ? kBrown30 : kGrey30;
        final oBoxColor =
            currentPlayer.seed == Seed.nought ? kBrown30 : kGrey30;

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
