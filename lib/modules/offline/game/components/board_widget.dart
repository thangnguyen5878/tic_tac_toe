import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/modules/offline/game/components/cell_widget.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final columnCount = GameController.to.room.board.columnCount;
    final rowCount = GameController.to.room.board.rowCount;
    print('build board ($columnCount, $rowCount)... ');

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
