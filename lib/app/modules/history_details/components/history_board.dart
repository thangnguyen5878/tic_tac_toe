import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/history_details/components/history_cell.dart';
import 'package:get/get.dart';

class HistoryBoard extends StatelessWidget {
  HistoryBoard({super.key});

  final gameController = Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    print('build board...');
    final columnCount = gameController.room.historyBoard.columnCount;
    final rowCount = gameController.room.historyBoard.rowCount;
    print('columnCount: $columnCount');
    print('rowCount: $rowCount');
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
            row: index ~/ columnCount,
            column: index % columnCount,
          );
        },
      ),
    );
  }
}