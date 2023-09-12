import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/global_controller.dart';
import 'package:tic_tac_toe/utils/cell_state.dart';
import 'package:tic_tac_toe/utils/colors.dart';
import 'package:tic_tac_toe/utils/seed.dart';

class CellWidget extends StatelessWidget {
  int row = -1;
  int column = -1;
  Color bColor = Colors.white;
  CellState state = CellState.normal;

  CellWidget({super.key, required this.row, required this.column});

  @override
  Widget build(BuildContext context) {
    // print('build cell($row, $column)');

    return InkWell(
      child: GetBuilder(
        init: GlobalController(),
        builder: (GlobalController controller) {
          if (GlobalController.to.game.board.cells[row][column].state == CellState.crossWin) {
            state = CellState.crossWin;
            bColor = lightRed;
          }
          if (GlobalController.to.game.board.cells[row][column].state == CellState.noughtWin) {
            state = CellState.noughtWin;
            bColor = lightGreen;
          }
          if (GlobalController.to.game.board.cells[row][column].state == CellState.normal) {
            state = CellState.normal;
            bColor = Colors.white;
          }
          // print('build cell($row,$column) $bColor $state');
          return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1), color: bColor),
              child: Text(
                GlobalController.to.game.board.cells[row][column].content.toStringValue(),
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ));
        },
      ),
      onTap: () {
        // GlobalController.to.game.nextTurn();
        print('Tap cell($row, $column) : ${GlobalController.to.game.currentPlayer.seed}');
        GlobalController.to.drawSeed(row, column, GlobalController.to.game.currentPlayer.seed);
      },
    );
  }
}
