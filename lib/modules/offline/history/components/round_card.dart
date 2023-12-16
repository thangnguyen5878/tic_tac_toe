import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/models/offline/round.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';

class RoundCard extends StatelessWidget {
  final Round round;
  final int roomId;

  RoundCard({super.key, required this.round, required this.roomId});

  @override
  Widget build(BuildContext context) {
    final roundCount = round.getRoundCount();
    final player1Name = round.getPlayer1().name;
    final player1Score = round.getPlayer1().score;
    final player2Name = round.getPlayer2().name;
    final player2Score = round.getPlayer2().score;
    final winnerName = round.hasWinner() ? round.getWinner().name : '';

    Color winnerColor;
    if (round.isPlayer1Win()) {
      winnerColor = kRed70;
    } else if (round.isPlayer2Win()) {
      winnerColor = kGreen60;
    } else {
      winnerColor = kBlack; // You can choose another color
    }

    // print('round card $round');
    // print('player 1: $player1Name $player1Score');
    // print('player 2: $player2Name $player2Score');
    // print('winner: $winnerName $winnerColor');

    return InkWell(
      onTap: () {
        GameController.to.room.historyRoundIndex = round.index!;
        Get.toNamed(Routes.HISTORY_DETAILS, arguments: [roomId, round.index]);
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
            if (round.hasWinner())
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: kNormalLargeText,
                      children: <TextSpan>[
                        const TextSpan(text: 'Winner: '),
                        TextSpan(
                            text: '$winnerName',
                            style: TextStyle(color: winnerColor)),
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
