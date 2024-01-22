import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class RoundTile extends StatelessWidget {
  final Room room;
  final int roundIndex;

  const RoundTile({super.key, required this.roundIndex, required this.room});

  @override
  Widget build(BuildContext context) {
    logger.t('Build round tile $roundIndex.');

    final round = room.getRound(roundIndex);
    final roundCount = round.getRoundCount();

    final player1Name = room.getPlayer1().name;
    final player1Score = round.getPlayer1Score().currentScore;
    final player2Name = room.getPlayer2().name;
    final player2Score = round.getPlayer2Score().currentScore;
    final winnerName = round.hasWinner() ? room.getWinnerOfRound(roundIndex)?.name : '';

    Color winnerColor;
    if (round.isPlayer1Win()) {
      winnerColor = kDarkRed;
    } else if (round.isPlayer2Win()) {
      winnerColor = kDarkGreen;
    } else {
      winnerColor = kBlack; // You can choose another color
    }

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
