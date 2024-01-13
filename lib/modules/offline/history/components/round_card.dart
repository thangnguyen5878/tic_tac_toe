import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';

class RoundCard extends StatelessWidget {
  final int roundIndex;

  const RoundCard({super.key, required this.roundIndex});

  @override
  Widget build(BuildContext context) {
    final room = GameController.to.room;
    final round = room.getRound(roundIndex);
    final roundCount = round.getRoundCount();
    final player1Name = room.getPlayer1().name;
    final player1Score = round.getPlayer1Score().currentScore;
    final player2Name = room.getPlayer2().name;
    final player2Score = round.getPlayer2Score().currentScore;
    final winnerName = round.hasWinner() ? room.getWinnerOfRound(roundIndex)?.name : '';

    Color winnerColor;
    if (round.isPlayer1Win()) {
      winnerColor = kRed70;
    } else if (round.isPlayer2Win()) {
      winnerColor = kGreen60;
    } else {
      winnerColor = kBlack; // You can choose another color
    }

    // logger.t('round card $round');
    // logger.t('player 1: $player1Name $player1Score');
    // logger.t('player 2: $player2Name $player2Score');
    // logger.t('winner: $winnerName $winnerColor');

    return InkWell(
      onTap: () {
        GameController.to.viewHistoryRoundDetails(roundIndex);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: kCardStyle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Round $roundCount',
              style: kHeading1,
            ),
            const SizedBox(height: 4),
            if (room.getRound(roundIndex).hasWinner())
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: kNormalLargeText,
                      children: <TextSpan>[
                        const TextSpan(text: 'Winner: '),
                        TextSpan(text: '$winnerName', style: TextStyle(color: winnerColor)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            Text(
              '$player1Name ($player1Score) - $player2Name ($player2Score)',
              style: kNormalText,
            ),
            // Add more widgets to display additional room information
          ],
        ),
      ),
    );
  }
}
