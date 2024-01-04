import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/models/online/online_room.dart';
import 'package:flutter_tic_tac_toe/models/online/online_user.dart';
import 'package:flutter_tic_tac_toe/modules/offline/game/components/cell_widget.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/online_user_tile.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_game/components/online_cell_widget.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class OnlineBoardWidget extends StatelessWidget {
  final OnlineRoom room;

  const OnlineBoardWidget({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    final columnCount = room.board.columnCount;
    final rowCount = room.board.rowCount;
    logger.t('build online board ($rowCount, $columnCount)');

    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount!,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 1,
        ),
        itemCount: columnCount * rowCount!,
        itemBuilder: (context, index) {
          return OnlineCellWidget(
            row: index ~/ columnCount,
            column: index % columnCount,
            room: room,
          );
        },
      ),
    );
  }
}
