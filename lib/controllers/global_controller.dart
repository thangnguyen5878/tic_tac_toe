import 'package:tic_tac_toe/models/cell.dart';
import 'package:tic_tac_toe/models/game.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/utils/round_state.dart';
import 'package:tic_tac_toe/utils/seed.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  Game game = Game();

  var inputRowsController = TextEditingController();
  var inputColumnsController = TextEditingController();
  var inputPlayer1Controller = TextEditingController();
  var inputPlayer2Controller = TextEditingController();

  initGame() {
    print('init game');
    print(game);
    update();
  }

  drawSeed(int row, int column, Seed seed) {
    print('draw seed...');
    Cell cell = game.board.cells[row][column];
    if (game.currentRound.state == RoundState.playing &&
        (cell.content != Seed.cross && cell.content != Seed.nought)) {
      print(
          '${game.currentPlayer.name} draw seed $seed at cell($row, $column)');
      cell.content = seed;
      game.checkWinner();
      if (game.currentRound.winner == null) {
        game.nextTurn();
      }
      // print(game.board.cells);
      update();
    }
  }

  nextRound() {
    game.nextRound();
    update();
    print('next round, current round: ${game.currentRound.number}');
  }

  resetGame() {
    clearInput();
    game = Game();
    update();
    print('reset game');
  }

  clearInput() {
    inputRowsController.clear();
    inputColumnsController.clear();
    inputPlayer1Controller.clear();
    inputPlayer2Controller.clear();
    print('input cleared');
    update();
  }
}
