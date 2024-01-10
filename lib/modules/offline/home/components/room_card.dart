import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/home_controller.dart';
import 'package:flutter_tic_tac_toe/models/offline/room.dart';
import 'package:flutter_tic_tac_toe/modules/offline/home/components/room_card_normal_mode.dart';
import 'package:flutter_tic_tac_toe/modules/offline/home/components/room_card_selection_mode.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  final int index;

  const RoomCard(this.room, this.index ,{super.key});

  @override
  Widget build(BuildContext context) {

    if(!HomeController.to.isRoomSelectionMode) {
      // room card in normal mode
      return RoomCardNormalMode(room: room);
    } else {
      // room card in selection mode
      return RoomCardSelectionMode(room: room);
    }
  }
}
