import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/tiles/room_tile_normal_mode.dart';
import 'package:flutter_tic_tac_toe/components/tiles/room_tile_selection_mode.dart';
import 'package:flutter_tic_tac_toe/controllers/home_controller.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:get/get.dart';

class RoomTile extends StatelessWidget {
  final Room room;

  const RoomTile(this.room, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        if (controller.isRoomSelectionMode) {
          return RoomTileSelectionMode(room: room);
        } else {
          return RoomTileNormalMode(room: room);
        }
      },
    );
  }
}
