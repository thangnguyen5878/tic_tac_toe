import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/widget/cell_widget.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print('build board...');
    final columnCount = GameController.to.room.board.columnCount;
    final rowCount = GameController.to.room.board.rowCount;
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
          return CellWidget(
            row: index ~/ columnCount,
            column: index % columnCount,
          );
        },
      ),
    );
  }
}