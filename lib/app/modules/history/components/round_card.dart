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
    final player1 = round.players![0];
    final player2 = round.players![1];
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
        gameController.room.historyRoundIndex = round.number! - 1;
        Get.toNamed(Routes.HISTORY_DETAILS, arguments: [roomId, round.number]);
      },
      child: Container(
        padding: EdgeInsets.all(kPadding12),
        decoration: kCardStyle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Round ${round.number}',
              style: kHeading1,
            ),
            SizedBox(height: kPadding4),
            if (winnerIndex != null)
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: kNormalLarge,
                      children: <TextSpan>[
                        TextSpan(text: 'Winner: '),
                        TextSpan(text: '${round.players![winnerIndex].name}', style: TextStyle(color: winnerColor )),
                      ],
                    ),
                  ),
                  SizedBox(height: kPadding4),
                ],
              ),
            Text('${player1.name} (${player1.score}) - ${player2.name} (${player2.score})', style: kNormal,),
            // Add more widgets to display additional room information
          ],
        ),
      ),
    );
  }
}
