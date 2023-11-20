import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  RoomCard(
      this.room, {super.key});

  @override
  Widget build(BuildContext context) {
    final round = room.getCurrentRound();

    final player1Name = round.getPlayer1().name;
    final player1Score = round.getPlayer1().score;
    final player2Name = round.getPlayer2().name;
    final player2Score = round.getPlayer2().score;
    final roundCount = room.getRoundCount();

    return InkWell(
      onTap: () async {
        await GameController.to.loadRoomById(room.id);
        Get.toNamed(Routes.GAME, arguments: room.id);
      },
      child: Container(
        padding: EdgeInsets.all(kPadding12),
        decoration: kCardStyle,
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              room.name,
              style: kHeading1,
            ),
            SizedBox(height: kPadding8),
            Text(
              style: kNormal,
              '$player1Name ($player1Score) - $player2Name ($player2Score), round: $roundCount',
            ),
            // Add more widgets to display additional room information
          ],
        ),
      ),
    );
  }
}
