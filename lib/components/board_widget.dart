import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/cell_widget.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

import '../utils/constants/constants.dart';

class BoardWidget extends StatelessWidget {
  final Room room;
  final bool isHistory;

  BoardWidget({super.key, required this.room, bool? isHistory}) : isHistory = isHistory ?? false;

  @override
  Widget build(BuildContext context) {
    final board;
    if (!isHistory) {
      board = room.board;
    } else {
      board = room.history.board;
    }

    final columnCount = board.columnCount;
    final rowCount = board.rowCount;
    logger.t('Build Board Widget $columnCount x $rowCount.');

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
          final int row = index ~/ columnCount;
          final int column = index % columnCount as int;

          return CellWidget(
            room: room,
            row: row,
            column: column,
            isHistory: isHistory,
            onTap: () {
              if (isOffline && !isHistory) {
                final room = GameController.to.room;
                logger.t('Tap cell($row, $column) : ${room.getCurrentPlayer().seed}');
                GameController.to.drawSeed(row, column, room.getCurrentPlayer().seed!);
              }
              if (isOnline && !isHistory) {
                if (OnlineUserController.to.currentUser.playerIndex ==
                    room.getCurrentRound().currentPlayerIndex) {
                  OnlineGameController.to
                      .drawSeedOnCell(row, column, room.getCurrentPlayer().seed!);
                  logger.t(
                      'tap cell, player index: ${OnlineUserController.to.currentUser.playerIndex}');
                }
              }
            },
          );
        },
      ),
    );
  }
}
