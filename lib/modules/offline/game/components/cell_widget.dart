import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/cell_constants.dart';

// ignore: must_be_immutable
class CellWidget extends StatelessWidget {
  void Function() onTap;
  final Room room;
  final int row;
  final int column;
  final bool isHistory;

  CellWidget(
      {Key? key,
      required this.onTap,
      bool? isHistory,
      required this.room,
      required this.row,
      required this.column})
      : isHistory = isHistory ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final board;
    if (!isHistory) {
      board = room.board;
    } else {
      board = room.history.board;
    }

    final cell = board.getCell(row, column);
    final content = cell.content.toString();

    Color backgroundColor = Colors.white;
    if (!isHistory) {
      // NORMAL GAME
      if (cell.isPlayer1Win()) {
        backgroundColor = CellConstants.crossWinColor;
      }
      if (cell.isPlayer2Win()) {
        backgroundColor = CellConstants.noughtWinColor;
      }
    } else {
      // HISTORY
      if (room.isPlayer1WinInHistory() && cell.isPlayer1Win()) {
        backgroundColor = CellConstants.crossWinColorInHistory;
      }
      if (room.isPlayer2WinInHistory() && cell.isPlayer2Win()) {
        backgroundColor = CellConstants.noughtWinColorInHistory;
      }
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
