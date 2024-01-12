// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:get/get.dart';

class GamePopupMenuButton extends StatelessWidget {
  GamePopupMenuButton({
    super.key,
  });

  var roomId;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'reset',
          child: Text('Reset'),
          // Remove the style parameter
        ),
        // const PopupMenuItem<String>(
        //   value: 'history',
        //   child: Text('History'),
        //   // Remove the style parameter
        // ),
      ],
      onSelected: (String value) async {
        if (value == 'reset') {
          GameController.to.resetBoard();
          await GameController.to.saveRoomToIsarDatabase();
        } else if (value == 'history') {
          logger.t('Going to History Page, roomId = $roomId');
          GameController.to.saveRoomToIsarDatabase();
          roomId = await GameController.to.saveRoomToIsarDatabase();
          Get.toNamed(Routes.HISTORY, arguments: roomId);
        }
      },
      icon: const Icon(
        Icons.more_vert,
        color: Colors.black,
        size: kIconSize, // Set the color of the three dots icon to black
      ),
    );
  }
}
