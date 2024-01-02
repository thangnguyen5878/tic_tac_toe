import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/home_controller.dart';
import 'package:flutter_tic_tac_toe/models/offline/room.dart';
import 'package:flutter_tic_tac_toe/models/offline/round.dart';
import 'package:flutter_tic_tac_toe/modules/offline/home/components/room_card_normal_mode.dart';
import 'package:flutter_tic_tac_toe/modules/offline/home/components/room_card_selection_mode.dart';
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

    if(!HomeController.to.isRoomSelectionMode) {
      // room card in normal mode
      return roomCardNormalMode(room: room);
    } else {
      // room card in selection mode
      return roomCardSelectionMode(room: room);
    }
  }
}
