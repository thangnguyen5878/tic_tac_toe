import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/home_controller.dart';
import 'package:flutter_tic_tac_toe/models/offline/room.dart';
import 'package:flutter_tic_tac_toe/models/offline/round.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';

class roomCardSelectionMode extends StatelessWidget {
  const roomCardSelectionMode({
    super.key,
    required this.room
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    final round = room.getCurrentRound();

    return InkWell(
      onTap: () {
        if(HomeController.to.isRoomCardSelected(room.id)) {
          HomeController.to.removeSelectedRoom(room.id);
        } else {
          HomeController.to.addSelectedRoom(room.id);
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12),
        decoration: HomeController.to.isRoomCardSelected(room.id) ? kSelectedCardStyle : kCardStyle,
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