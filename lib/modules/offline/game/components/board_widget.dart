import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/modules/offline/game/components/cell_widget.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class BoardWidget extends StatelessWidget {
  final Room room;
  BoardWidget({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    final columnCount = room.board.columnCount;
    final rowCount = room.board.rowCount;
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
          final int column = index % columnCount;

          return CellWidget(
            row: row,
            column: column,
            room: room,
            onTap: () {
              logger.t('Tap cell($row, $column) : ${room.getCurrentPlayer().seed}');
              GameController.to.drawSeed(row, column, room.getCurrentPlayer().seed!);
            },
          );
        },
      ),
    );
  }
}
