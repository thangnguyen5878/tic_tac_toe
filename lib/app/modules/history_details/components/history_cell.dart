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
    // print('build cell($row, $column)');
    return InkWell(
      child: GetBuilder(
        init: GameController(),
        builder: (GameController gameController) {
          final content = gameController.room.historyBoard.cells[row][column].content.toString();
          CellState state = gameController.room.historyBoard.cells[row][column].state!;

          if (state == CellState.crossWin) {
            state = CellState.crossWin;
          }
          if (state == CellState.noughtWin) {
            state = CellState.noughtWin;
          }
          if (state == CellState.normal) {
            state = CellState.normal;
          }
          // print('build cell($row,$column) $bColor $state');
          return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: kBlack, width: 1), color: kWhite),
              child: Text(
                content,
                style: const TextStyle(fontSize: 20, color: kBlack),
              ));
        },
      ),
    );
  }
}
