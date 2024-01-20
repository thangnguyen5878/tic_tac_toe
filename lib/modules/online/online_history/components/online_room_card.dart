import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class OnlineRoomCard extends StatelessWidget {
  const OnlineRoomCard({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    logger.t('build a online room card');

    return InkWell(
      onTap: () {
        // await OnlineGameController.to.loadRoomById(room.id);
        // Get.toNamed(Routes.GAME, arguments: room.id);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: kCardStyle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              room.name,
              style: kHeading1,
            ),
            const SizedBox(height: 4),
            RichText(
              text: TextSpan(
                style: kNormalLargeText,
                children: <TextSpan>[
                  const TextSpan(text: 'Current round: '),
                  TextSpan(
                      text: '${room.getRoundCount()}', style: const TextStyle(color: kBrown55)),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              style: kNormalText,
              '${room.getPlayer1().name} (${room.getPlayer1Score().currentScore}) - ${room.getPlayer2().name} (${room.getPlayer2Score().currentScore})',
            ),
            // Add more widgets to display additional room information
          ],
        ),
      ),
    );
  }
}
