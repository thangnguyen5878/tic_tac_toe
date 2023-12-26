import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/modules/offline/history_details/components/history_cell.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class HistoryBoard extends StatelessWidget {
  HistoryBoard({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('build history board...');
    final room = GameController.to.room;

    final columnCount = room.historyBoard.columnCount;
    final rowCount = room.historyBoard.rowCount;

    GameController.to.room.updateHistoryBoard();

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
          return HistoryCell(
              row: index ~/ columnCount, column: index % columnCount);
        },
      ),
    );
  }
}
