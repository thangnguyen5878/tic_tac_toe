import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HistoryCell extends StatelessWidget {
  // initialize a dump value for row and column
  int row = -1;
  int column = -1;

  final gameController = Get.find<GameController>();

  HistoryCell({super.key, required this.row, required this.column});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      child: GetBuilder(
        init: GameController(),
        builder: (GameController gameController) {
          final room = gameController.room;
          final historyBoard = room.historyBoard;
          final content = historyBoard.cells[row][column].content.toString();
          CellState state = historyBoard.cells[row][column].state!;
          final historyRound = room.rounds![room.historyRoundIndex];
          bool isWinTurn = historyRound!.historyCurrentTurnIndex == historyRound.winTurnIndex;

          Color bColor = Colors.white;

          if (state == CellState.crossWin && isWinTurn == true) {
              bColor = kRed20;
          }
          if (state == CellState.noughtWin && isWinTurn == true) {
              bColor = kGreen30;
          }
          // print('build cell($row, $column), $state, $bColor, $isWinTurn, ${historyRound!.historyCurrentTurnIndex}, ${historyRound.winTurnIndex}');
          // print('build cell($row,$column) $bColor $state');
          return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: kBlack, width: 1), color: bColor),
              child: Text(
                content,
                style: const TextStyle(fontSize: 20, color: kBlack),
              ));
        },
      ),
    );
  }
}
