import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/home_controller.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';

class RoomTileNormalMode extends StatelessWidget {
  const RoomTileNormalMode({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    logger.t(
        'Build a room tile in normal mode, room(id: ${room.isarId}, name: ${room.name}, lastAccessAt: ${room.lastAccessAt})');

    return InkWell(
      onTap: () {
        GameController.to.openRoom(room.isarId);
      },
      onLongPress: () {
        HomeController.to.activateRoomSelectionMode(room.isarId);
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
                      text: '${room.getRoundCount()}', style: const TextStyle(color: kBrown60)),
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
