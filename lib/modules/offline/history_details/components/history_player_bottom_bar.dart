import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HistoryPlayerBottomBar extends StatelessWidget {
  const HistoryPlayerBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 48,
      child: GetBuilder(builder: (GameController gameController) {
        final room = GameController.to.room;
        final round = room.getHistoryCurrentRound();

        // Player 1's data
        final player1Name = room.getPlayer1().name;
        final player1Score = room.getHistoryPlayer1CurrentScore();
        final player1TextColor = room.isPlayer1TurnInHistory() ? kBlack : kGrey45;
        final player1BoxColor = room.isPlayer1TurnInHistory() ? kBrown30_history : kGrey30;

        // Player 2's data
        final player2Name = room.getPlayer2().name;
        final player2Score = room.getHistoryPlayer2CurrentScore();
        final player2TextColor = room.isPlayer2TurnInHistory() ? kBlack : kGrey45;
        final player2BoxColor = room.isPlayer2TurnInHistory() ? kBrown30_history : kGrey30;

        // logger.t('history player bottom bar: ${round.winTurnIndex}');
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
                      '$player1Name: X',
                      style: TextStyle(color: player1TextColor, fontWeight: FontWeight.bold),
                    ),
                    Text('Score: $player1Score',
                        style: TextStyle(color: player1TextColor, fontWeight: FontWeight.bold)),
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
                      '$player2Name: O',
                      style: TextStyle(color: player2TextColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Score: $player2Score',
                      style: TextStyle(color: player2TextColor, fontWeight: FontWeight.bold),
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
