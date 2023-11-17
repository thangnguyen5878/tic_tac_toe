import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HistoryPlayerBottomBar extends StatelessWidget {
  HistoryPlayerBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 48,
      child: GetBuilder(builder: (GameController gameController) {
        final room = GameController.to.room;
        final round = room.getCurrentHistoryRound();

        int? historyCurrentPlayerIndex = round.historyPlayerIndex;
        if(round.winTurnIndex != -1 && round.historyTurnIndex == round.winTurnIndex! + 1) {
          print('history win turn!!!');
          historyCurrentPlayerIndex = round.winnerIndex!;
        }

        final player1 = round.players![0];
        final player2 = round.players![1];;
        final isWinTurn = round.historyTurnIndex == round.winTurnIndex;

        final player1Score = isWinTurn ? player1.finalScore : player1.initialScore;
        final player2Score = isWinTurn ? player2.finalScore : player2.initialScore;
        final player1TextColor = historyCurrentPlayerIndex == 0 ? kBlack : kGrey45;
        final player2TextColor = historyCurrentPlayerIndex == 1 ? kBlack : kGrey45;
        final player1BoxColor = historyCurrentPlayerIndex == 0 ? kBrown30 : kGrey30;
        final player2BoxColor = historyCurrentPlayerIndex == 1 ? kBrown30 : kGrey30;

        print('history player bottom bar: $isWinTurn, ${round.winTurnIndex}, $historyCurrentPlayerIndex');
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Player 1 Box
            Expanded(
              child: Container(
                color: player1BoxColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${player1.name}: X',
                      style:
                      TextStyle(color: player1TextColor, fontWeight: FontWeight.bold),
                    ),
                    Text('Score: $player1Score',
                        style: TextStyle(
                            color: player1TextColor, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            // Player 2 Box
            Expanded(
              child: Container(
                color: player2BoxColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${player2.name}: O',
                      style:
                      TextStyle(color: player2TextColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Score: $player2Score',
                      style:
                      TextStyle(color: player2TextColor, fontWeight: FontWeight.bold),
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
