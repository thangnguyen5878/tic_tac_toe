import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/home_controller.dart';
import 'package:flutter_tic_tac_toe/models/offline/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class RoomCardSelectionMode extends StatelessWidget {
  const RoomCardSelectionMode({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    logger.t('build a room card in selection mode');

    return InkWell(
      onTap: () {
        if (HomeController.to.isRoomCardSelected(room.id)) {
          HomeController.to.removeSelectedRoom(room.id);
        } else {
          HomeController.to.addSelectedRoom(room.id);
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: HomeController.to.isRoomCardSelected(room.id) ? kSelectedCardStyle : kCardStyle,
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
