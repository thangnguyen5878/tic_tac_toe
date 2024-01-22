import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/home_controller.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';

class RoomTileSelectionMode extends StatelessWidget {
  const RoomTileSelectionMode({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    logger.t('Build a room tile in selection mode.');

    return InkWell(
      onTap: () {
        if (HomeController.to.isRoomTileSelected(room.isarId)) {
          HomeController.to.removeSelectedRoom(room.isarId);
        } else {
          HomeController.to.addSelectedRoom(room.isarId);
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration:
            HomeController.to.isRoomTileSelected(room.isarId) ? kSelectedCardStyle : kCardStyle,
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
                  TextSpan(text: '${room.roundCount}', style: const TextStyle(color: kBrown60)),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              style: kNormalText,
              '${room.player1.name} (${room.player1Score.currentScore}) - ${room.player2.name} (${room.player2Score.currentScore})',
            ),
            // Add more widgets to display additional room information
          ],
        ),
      ),
    );
  }
}
