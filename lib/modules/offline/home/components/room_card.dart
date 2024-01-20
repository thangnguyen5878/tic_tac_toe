import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/home_controller.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/modules/offline/home/components/room_card_normal_mode.dart';
import 'package:flutter_tic_tac_toe/modules/offline/home/components/room_card_selection_mode.dart';
import 'package:get/get.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard(this.room, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        if (controller.isRoomSelectionMode) {
          return RoomCardSelectionMode(room: room);
        } else {
          return RoomCardNormalMode(room: room);
        }
      },
    );
  }
}
