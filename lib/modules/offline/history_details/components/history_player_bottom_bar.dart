import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/player_bottom_bar_constants.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class PlayerBottomBar extends StatelessWidget {
  final Room room;
  final bool isHistory;

  PlayerBottomBar({
    super.key,
    required this.room,
    bool? isHistory,
  }) : isHistory = isHistory ?? false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 48,
      child: GetBuilder(builder: (GameController gameController) {
        final String player1Name;
        final int player1Score;
        final Color player1TextColor;
        final Color player1BoxColor;

        final String player2Name;
        final int player2Score;
        final Color player2TextColor;
        final Color player2BoxColor;

        if (!isHistory) {
          // NORMAL GAME
          // Player 1
          player1Name = room.getPlayer1().name!;
          player1Score = room.getPlayer1Score().currentScore;
          player1TextColor = room.isPlayer1Turn()
              ? PlayerBottomBarConstants.selectedTextColor
              : PlayerBottomBarConstants.unselectedTextColor;
          player1BoxColor = room.isPlayer1Turn()
              ? PlayerBottomBarConstants.selectedBoxColor
              : PlayerBottomBarConstants.unselectedBoxColor;

          // Player 2
          player2Name = room.getPlayer2().name!;
          player2Score = room.getPlayer2Score().currentScore;
          player2TextColor = room.isPlayer2Turn()
              ? PlayerBottomBarConstants.selectedTextColor
              : PlayerBottomBarConstants.unselectedTextColor;
          player2BoxColor = room.isPlayer2Turn()
              ? PlayerBottomBarConstants.selectedBoxColor
              : PlayerBottomBarConstants.unselectedBoxColor;
        } else {
          // HISTORY
          // Player 1
          player1Name = room.getPlayer1().name!;
          player1Score = room.getPlayer1ScoreInHistory();
          player1TextColor = room.isPlayer1TurnInHistory()
              ? HistoryPlayerBottomBarConstants.selectedTextColor
              : HistoryPlayerBottomBarConstants.unselectedTextColor;
          player1BoxColor = room.isPlayer1TurnInHistory()
              ? HistoryPlayerBottomBarConstants.selectedBoxColor
              : HistoryPlayerBottomBarConstants.unselectedBoxColor;

          // Player 2
          player2Name = room.getPlayer2().name!;
          player2Score = room.getPlayer2ScoreInHistory();
          player2TextColor = room.isPlayer2TurnInHistory()
              ? HistoryPlayerBottomBarConstants.selectedTextColor
              : HistoryPlayerBottomBarConstants.unselectedTextColor;
          player2BoxColor = room.isPlayer2TurnInHistory()
              ? HistoryPlayerBottomBarConstants.selectedBoxColor
              : HistoryPlayerBottomBarConstants.unselectedBoxColor;
        }

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
