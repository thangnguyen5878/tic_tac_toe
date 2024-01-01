import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/home_controller.dart';
import 'package:flutter_tic_tac_toe/models/offline/room.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  final int index;

  RoomCard(this.room, this.index ,{super.key});

  @override
  Widget build(BuildContext context) {
    final round = room.getCurrentRound();

    final player1Name = round.getPlayer1().name;
    final player1Score = round.getPlayer1().score;
    final player2Name = round.getPlayer2().name;
    final player2Score = round.getPlayer2().score;
    final roundCount = room.getRoundCount();

    if(!HomeController.to.isRoomSelectionMode) {
      // room card in normal mode
      return InkWell(
        onTap: () async {
          await GameController.to.loadRoomById(room.id);
          Get.toNamed(Routes.GAME, arguments: room.id);
        },
        onLongPress: () {
          HomeController.to.activateRoomSelectionMode(index, room.id);
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: HomeController.to.isRoomCardSelected(index) ? kSelectedCardStyle : kCardStyle,
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
                        text: '$roundCount', style: TextStyle(color: kBrown55)),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Text(
                style: kNormalText,
                '$player1Name ($player1Score) - $player2Name ($player2Score)',
              ),
              // Add more widgets to display additional room information
            ],
          ),
        ),
      );
    } else {
      // room card in selection mode
      return InkWell(
        onTap: () {
          if(HomeController.to.isRoomCardSelected(index)) {
            HomeController.to.removeSelectedRoom(index, room.id);
          } else {
            HomeController.to.addSelectedRoom(index, room.id);
          }
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: HomeController.to.isRoomCardSelected(index) ? kSelectedCardStyle : kCardStyle,
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
                        text: '$roundCount', style: TextStyle(color: kBrown55)),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Text(
                style: kNormalText,
                '$player1Name ($player1Score) - $player2Name ($player2Score)',
              ),
              // Add more widgets to display additional room information
            ],
          ),
        ),
      );
    }

  }
}
