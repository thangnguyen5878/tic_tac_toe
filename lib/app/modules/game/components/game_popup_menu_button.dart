import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:get/get.dart';

class GamePopupMenuButton extends StatelessWidget {
  GamePopupMenuButton({
    super.key,
    required this.gameController,
    required this.roomId,
  });

  final GameController gameController;
  var roomId;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'reset',
          child: Text('Reset'),
          // Remove the style parameter
        ),
        PopupMenuItem<String>(
          value: 'history',
          child: Text('History'),
          // Remove the style parameter
        ),
      ],
      onSelected: (String value) async {
        if (value == 'reset') {
          gameController.resetBoard();
          gameController.saveRoom();
        } else if (value == 'history') {
          print('Going to History Page, roomId = $roomId');
          roomId = await gameController.saveRoom();
          Get.toNamed(Routes.HISTORY, arguments: roomId);
        }
      },
      icon: Icon(
        Icons.more_vert,
        color: Colors.black,
        size: kIconSize,// Set the color of the three dots icon to black
      ),
    );
  }
}