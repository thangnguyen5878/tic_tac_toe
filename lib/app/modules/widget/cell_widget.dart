import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:flutter_tic_tac_toe/utils/cell_state.dart';
import 'package:flutter_tic_tac_toe/values/app_colors.dart';
import 'package:flutter_tic_tac_toe/values/color_constants.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CellWidget extends StatelessWidget {
  // initialize a dump value for row and column
  int row = -1;
  int column = -1;

  final gameController = Get.find<GameController>();

  CellWidget({super.key, required this.row, required this.column});

  @override
  Widget build(BuildContext context) {
    // print('build cell($row, $column)');
    return InkWell(
      child: GetBuilder(
        init: GameController(),
        builder: (GameController game) {
          final content =
              game.room.board!.cells[row][column]!.content.toString();
          CellState state = game.room.board.cells[row][column].state!;
          Color bColor = Colors.white;

          if (state == CellState.crossWin) {
            state = CellState.crossWin;
            bColor = lightRed;
          }
          if (state == CellState.noughtWin) {
            state = CellState.noughtWin;
            bColor = lightGreen;
          }
          if (state == CellState.normal) {
            state = CellState.normal;
            bColor = Colors.white;
          }
          // print('build cell($row,$column) $bColor $state');
          return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black, width: 1),
                  color: bColor),
              child: Text(
                content,
                style: const TextStyle(fontSize: 20, color: AppColors.black),
              ));
        },
      ),
      onTap: () {
        final currentPlayer = gameController.room.currentRound.currentPlayer;
        // game.game.nextTurn();
        print('Tap cell($row, $column) : ${currentPlayer!.seed}');
        gameController.drawSeed(row, column, currentPlayer.seed!);
      },
    );
  }
}
