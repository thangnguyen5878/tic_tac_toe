import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/player_bottom_bar_constants.dart';

class PlayerStatusBar extends StatelessWidget {
  final Room room;
  final bool isHistory;

  PlayerStatusBar({
    super.key,
    required this.room,
    bool? isHistory,
  }) : isHistory = isHistory ?? false;

  @override
  Widget build(BuildContext context) {
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
      player1Name = room.player1.name!;
      player1Score = room.player1Score.currentScore;
      player1TextColor = room.isPlayer1Turn
          ? PlayerBottomBarConstants.selectedTextColor
          : PlayerBottomBarConstants.unselectedTextColor;
      player1BoxColor = room.isPlayer1Turn
          ? PlayerBottomBarConstants.selectedBoxColor
          : PlayerBottomBarConstants.unselectedBoxColor;

      // Player 2
      player2Name = room.player2.name!;
      player2Score = room.player2Score.currentScore;
      player2TextColor = room.isPlayer2Turn
          ? PlayerBottomBarConstants.selectedTextColor
          : PlayerBottomBarConstants.unselectedTextColor;
      player2BoxColor = room.isPlayer2Turn
          ? PlayerBottomBarConstants.selectedBoxColor
          : PlayerBottomBarConstants.unselectedBoxColor;
    } else {
      // HISTORY
      // Player 1
      player1Name = room.player1.name!;
      player1Score = room.player1ScoreInHistory;
      player1TextColor = room.isPlayer1TurnInHistory
          ? HistoryPlayerBottomBarConstants.selectedTextColor
          : HistoryPlayerBottomBarConstants.unselectedTextColor;
      player1BoxColor = room.isPlayer1TurnInHistory
          ? HistoryPlayerBottomBarConstants.selectedBoxColor
          : HistoryPlayerBottomBarConstants.unselectedBoxColor;

      // Player 2
      player2Name = room.player2.name!;
      player2Score = room.player2ScoreInHistory;
      player2TextColor = room.isPlayer2TurnInHistory
          ? HistoryPlayerBottomBarConstants.selectedTextColor
          : HistoryPlayerBottomBarConstants.unselectedTextColor;
      player2BoxColor = room.isPlayer2TurnInHistory
          ? HistoryPlayerBottomBarConstants.selectedBoxColor
          : HistoryPlayerBottomBarConstants.unselectedBoxColor;
    }

    return Container(
      color: Colors.grey,
      height: 48,
      child: Row(
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
      ),
    );
  }
}
