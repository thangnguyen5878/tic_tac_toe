import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';

class RoundTile extends StatelessWidget {
  final Room room;
  final int roundIndex;

  const RoundTile({super.key, required this.roundIndex, required this.room});

  @override
  Widget build(BuildContext context) {
    logger.t('Build round tile $roundIndex.');

    final round = room.rounds[roundIndex];
    final roundCount = round.roundCount;

    final player1Name = room.player1.name;
    final player1Score = round.player1Score.currentScore;
    final player2Name = room.player2.name;
    final player2Score = round.player2Score.currentScore;
    final winnerName = round.hasWinner ? room.winnerOfRound(roundIndex)?.name : '';

    Color winnerColor;
    if (round.isPlayer1Win) {
      winnerColor = kDarkRed;
    } else if (round.isPlayer2Win) {
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
            if (room.rounds[roundIndex].hasWinner)
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
