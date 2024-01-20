import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/models/offline/room.dart';
import 'package:flutter_tic_tac_toe/modules/online/online_game/components/online_cell_widget.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class OnlineBoardWidget extends StatelessWidget {
  final Room room;

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
