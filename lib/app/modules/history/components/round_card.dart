import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/models/round.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';

class RoundCard extends StatelessWidget {
  final gameController = Get.find<GameController>();
  final Round round;
  final int roomId;

  RoundCard({super.key,required this.round, required this.roomId});

  @override
  Widget build(BuildContext context) {
    final winnerIndex = round.winnerIndex;
    final player1Name = round.players![0].name;
    final player1Score = round.players![0].score;
    final player2Name = round.players![1].name;
    final player2Score = round.players![1].score;

    Color winnerColor;
    if (winnerIndex == 0) {
      winnerColor = kRed70;
    } else if (winnerIndex == 1) {
      winnerColor = kGreen60;
    }
    else {
      winnerColor = kBlack; // You can choose another color
    }
    return InkWell(
      onTap: () {
        gameController.room.currentHistoryRoundIndex = round.number! - 1;
        Get.toNamed(Routes.HISTORY_DETAILS, arguments: [roomId, gameController.room.currentHistoryRoundIndex]);
      },
      child: Container(
        padding: const EdgeInsets.all(kPadding12),
        decoration: kCardStyle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Round ${round.number}',
              style: kHeading1,
            ),
            const SizedBox(height: kPadding4),
            if (winnerIndex != null)
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: kNormalLarge,
                      children: <TextSpan>[
                        const TextSpan(text: 'Winner: '),
                        TextSpan(text: '${round.players![winnerIndex].name}', style: TextStyle(color: winnerColor )),
                      ],
                    ),
                  ),
                  const SizedBox(height: kPadding4),
                ],
              ),
            Text('$player1Name ($player1Score) - $player2Name ($player2Score)', style: kNormal,),
            // Add more widgets to display additional room information
          ],
        ),
      ),
    );
  }
}
