import 'package:tic_tac_toe/models/cell.dart';
import 'package:tic_tac_toe/models/game.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/utils/game_state.dart';
import 'package:tic_tac_toe/utils/seed.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  // int rows = 5;
  // int columns = 5;
  // Player player1 = Player('Player 1', Seed.cross);
  // Player player2 = Player('Player 2', Seed.nought);
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
    Cell cell = game.board.cells[row][column];
    if (game.state == GameState.playing &&
        (cell.content != Seed.cross && cell.content != Seed.nought)) {
      print(
          '${game.currentPlayer.name} draw seed $seed at cell($row, $column)');
      cell.content = seed;
      game.checkWinner();
      if (game.winner == null) {
        game.nextTurn();
      }
      // print(game.board.cells);
      update();
    }
  }

  nextRound() {
    game.nextRound();
    update();
  }

  resetGame() {
    clearInput();
    game.reset();
    update();
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
