import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/home_controller.dart';
import 'package:flutter_tic_tac_toe/models/offline/room.dart';
import 'package:flutter_tic_tac_toe/models/offline/round.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';

class roomCardNormalMode extends StatelessWidget {
  const roomCardNormalMode({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    final round = room.getCurrentRound();

    return InkWell(
      onTap: () async {
        await GameController.to.loadRoomById(room.id);
        Get.toNamed(Routes.GAME, arguments: room.id);
      },
      onLongPress: () {
        HomeController.to.activateRoomSelectionMode(room.id);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12),
        decoration: kCardStyle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              room.name,
              style: kHeading1,
            ),
            SizedBox(height: 4),
            RichText(
              text: TextSpan(
                style: kNormalLargeText,
                children: <TextSpan>[
                  const TextSpan(text: 'Current round: '),
                  TextSpan(
                      text: '${room.getRoundCount()}', style: TextStyle(color: kBrown55)),
                ],
              ),
            ),
            SizedBox(height: 4),
            Text(
              style: kNormalText,
              '${round.getPlayer1().name} (${round.getPlayer1().score}) - ${round.getPlayer2().name} (${round.getPlayer2().score})',
            ),
            // Add more widgets to display additional room information
          ],
        ),
      ),
    );
  }
}