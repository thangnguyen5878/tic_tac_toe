import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/models/round.dart';
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
        final round = room.historyRound;

        final isPLayer1 = round.historyPlayer.index == 0;
        final isPlayer2 = round.historyPlayer.index == 1;

        final player1TextColor = isPLayer1 ? kBlack : kGrey45;
        final player1BoxColor = isPLayer1 ? kBrown30 : kGrey30;
        final player2TextColor = isPlayer2 ? kBlack : kGrey45;
        final player2BoxColor = isPlayer2 ? kBrown30 : kGrey30;

        print('history player bottom bar');
        print('isHistoryWinTurn: ${round.isHistoryWinTurn}');
        print('player 1 score (score initial final): ${round.player1.score} ${round.player1.initialScore} ${round.player1.finalScore}');
        print('player 2 score (score initial final): ${round.player2.score} ${round.player2.initialScore} ${round.player2.finalScore}');
        print('history round: $round');

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Player1Container(
                round: round,
                player1BoxColor: player1BoxColor,
                player1TextColor: player1TextColor),
            // Player 2 Box
            Player2Container(
                round: round,
                player2BoxColor: player2BoxColor,
                player2TextColor: player2TextColor),
          ],
        );
      }),
    );
  }
}

class Player2Container extends StatelessWidget {
  const Player2Container({
    super.key,
    required this.round,
    required this.player2BoxColor,
    required this.player2TextColor,
  });

  final Round round;
  final Color player2BoxColor;
  final Color player2TextColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: player2BoxColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${round.player2.name}: O',
              style: TextStyle(
                  color: player2TextColor, fontWeight: FontWeight.bold),
            ),
            Text(
              'Score: ${round.historyPlayer2Score}',
              style: TextStyle(
                  color: player2TextColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Player1Container extends StatelessWidget {
  const Player1Container({
    super.key,
    required this.round,
    required this.player1BoxColor,
    required this.player1TextColor,
  });

  final Round round;
  final Color player1BoxColor;
  final Color player1TextColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: player1BoxColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${round.player1.name}: X',
              style: TextStyle(
                  color: player1TextColor, fontWeight: FontWeight.bold),
            ),
            Text('Score: ${round.historyPlayer1Score}',
                style: TextStyle(
                    color: player1TextColor, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
