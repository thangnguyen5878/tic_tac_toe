import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/history_details/components/history_cell.dart';

class HistoryBoard extends StatelessWidget {
  HistoryBoard({super.key});

  @override
  Widget build(BuildContext context) {
    print('build history board...');
    final room = GameController.to.room;
    final columnCount = GameController.to.room.historyBoard.columnCount;
    final rowCount = GameController.to.room.historyBoard.rowCount;
    final historyRound = room.rounds![room.currentHistoryRoundIndex];
    bool isWinTurn = historyRound!.currentHistoryTurnIndex == historyRound.winTurnIndex;

    GameController.to.room.updateHistoryBoard();
    print(isWinTurn);
    print(historyRound.currentHistoryTurnIndex);
    print(historyRound.winTurnIndex);

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
            column: index % columnCount

          );
        },
      ),
    );
  }
}