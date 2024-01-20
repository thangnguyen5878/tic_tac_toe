import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';

// ignore: must_be_immutable
class CellWidget extends StatelessWidget {
  void Function() onTap;
  final Room room;
  final int row;
  final int column;

  CellWidget(
      {Key? key, required this.row, required this.column, required this.room, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cell = room.board.getCell(row, column);
    final content = cell.content.toString();

    Color backgroundColor = Colors.white;
    if (cell.isPlayer1Win()) {
      backgroundColor = kCrossCellWinBackgroundColor;
    }
    if (cell.isPlayer2Win()) {
      backgroundColor = kNoughtCellWinBackgroundColor;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: kBlack, width: 1),
          color: backgroundColor,
        ),
        child: Text(
          content,
          style: const TextStyle(fontSize: 20, color: kBlack),
        ),
      ),
    );
  }
}
