import 'package:get/get.dart';
import 'package:tic_tac_toe/models/board.dart';
import 'package:tic_tac_toe/models/player.dart';
import 'package:tic_tac_toe/utils/cell_state.dart';
import 'package:tic_tac_toe/utils/game_state.dart';
import 'package:tic_tac_toe/utils/seed.dart';

class Game {
  Player player1;
  Player player2;
  late Player currentPlayer;
  Player? winner;
  Board board;
  int roundCount;
  GameState state;
  final winCount = 5;

  Game({Player? player1, Player? player2})
      : player1 = player1 ?? Player('Player 1', Seed.cross),
        player2 = player2 ?? Player('Player 2', Seed.nought),
        board = Board(),
        state = GameState.playing,
        roundCount = 1 {
    currentPlayer = this.player1;
  }

  void nextTurn() {
    if (currentPlayer.seed == Seed.cross) {
      currentPlayer = player2;
    } else {
      currentPlayer = player1;
    }
    print('next turn, currentplayer: ${currentPlayer.name}');
  }

  void reset() {
    currentPlayer = player1;
    player1 = Player('Player 1', Seed.cross);
    player2 = Player('Player 2', Seed.nought);
    state = GameState.playing;
    winner = null;
    board = Board();
    print('reset player');
    print('Current player: $currentPlayer');
    print('Player 1: ${player1.name}');
    print('Player 2: ${player2.name}');
  }

  void checkWinner() {
    print('check winner...');
    // 5 seeds in a row
    for (int i = 0; i < board.rows; i++) {
      for (int j = 0; j <= board.columns - winCount; j++) {
        if (board.cells[i][j].content == board.cells[i][j + 1].content &&
            board.cells[i][j].content == board.cells[i][j + 2].content &&
            board.cells[i][j].content == board.cells[i][j + 3].content &&
            board.cells[i][j].content == board.cells[i][j + 4].content &&
            board.cells[i][j].content != '') {
          // X wins
          if (board.cells[i][j].content == Seed.cross) {
            winner = player1;
            player1.score++;
            state = GameState.stop;
            for (int offset = 0; offset < 5; offset++) {
              board.cells[i][j + offset].state = CellState.crossWin;
            }
            print('Winner is ${winner!.name}, score: ${winner!.score}');
            print(
                'Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            Get.toNamed('winner');
          }
          // O wins
          if (board.cells[i][j].content == Seed.nought) {
            winner = player2;
            player2.score++;
            state = GameState.stop;
            for (int offset = 0; offset < 5; offset++) {
              board.cells[i][j + offset].state = CellState.noughtWin;
            }
            print('Winner is ${winner!.name}, score: ${winner!.score}');
            Get.toNamed('winner');
          }
        }
      }
    }
    // 5 seeds in a column
    for (int j = 0; j < board.columns; j++) {
      for (int i = 0; i <= board.rows - winCount; i++) {
        if (board.cells[i][j].content == board.cells[i + 1][j].content &&
            board.cells[i][j].content == board.cells[i + 2][j].content &&
            board.cells[i][j].content == board.cells[i + 3][j].content &&
            board.cells[i][j].content == board.cells[i + 4][j].content &&
            board.cells[i][j].content != '') {
          // X wins
          if (board.cells[i][j].content == Seed.cross) {
            winner = player1;
            player1.score++;
            state = GameState.stop;
            for (int offset = 0; offset < 5; offset++) {
              board.cells[i + offset][j].state = CellState.crossWin;
            }
            print('Winner is ${winner!.name}, score: ${winner!.score}');
            print(
                'Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            Get.toNamed('winner');
          }
          // O wins
          if (board.cells[i][j].content == Seed.nought) {
            winner = player2;
            player2.score++;
            state = GameState.stop;
            for (int offset = 0; offset < 5; offset++) {
              board.cells[i + offset][j].state = CellState.noughtWin;
            }
            print('Winner is ${winner!.name}, score: ${winner!.score}');
            Get.toNamed('winner');
          }
        }
      }
    }
    // 3 seeds in a diagonal type: \
    for (int i = 0; i <= board.rows - winCount; i++) {
      for (int j = 0; j <= board.columns - winCount; j++) {
        if (board.cells[i][j].content == board.cells[i + 1][j + 1].content &&
            board.cells[i][j].content == board.cells[i + 2][j + 2].content &&
            board.cells[i][j].content == board.cells[i + 3][j + 3].content &&
            board.cells[i][j].content == board.cells[i + 4][j + 4].content &&
            board.cells[i][j].content != '') {
          // X wins
          if (board.cells[i][j].content == Seed.cross) {
            winner = player1;
            player1.score++;
            state = GameState.stop;
            // update cell state to change the cell color
            for (int offset = 0; offset < 5; offset++) {
              board.cells[i + offset][j + offset].state = CellState.crossWin;
            }
            print('Winner is ${winner!.name}, score: ${winner!.score}');
            print(
                'Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            Get.toNamed('winner');
          }
          // O wins
          if (board.cells[i][j].content == Seed.nought) {
            winner = player2;
            player2.score++;
            state = GameState.stop;
            for (int offset = 0; offset < 5; offset++) {
              board.cells[i + offset][j + offset].state = CellState.noughtWin;
            }
            print('Winner is ${winner!.name}, score: ${winner!.score}');
            Get.toNamed('winner');
          }
        }
      }
    }
    // 3 seeds in a diagonal type: /
    for (int i = 0; i <= board.rows - winCount; i++) {
      for (int j = winCount - 1; j < board.columns; j++) {
        if (board.cells[i][j].content == board.cells[i + 1][j - 1].content &&
            board.cells[i][j].content == board.cells[i + 2][j - 2].content &&
            board.cells[i][j].content == board.cells[i + 3][j - 3].content &&
            board.cells[i][j].content == board.cells[i + 4][j - 4].content &&
            board.cells[i][j].content != '') {
          // X wins
          if (board.cells[i][j].content == Seed.cross) {
            winner = player1;
            player1.score++;
            state = GameState.stop;
            for (int offset = 0; offset < 5; offset++) {
              board.cells[i + offset][j - offset].state = CellState.crossWin;
            }
            print('Winner is ${winner!.name}, score: ${winner!.score}');
            print(
                'Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            Get.toNamed('winner');
          }
          // O wins
          if (board.cells[i][j].content == Seed.nought) {
            winner = player2;
            player2.score++;
            state = GameState.stop;
            for (int offset = 0; offset < 5; offset++) {
              board.cells[i + offset][j - offset].state = CellState.noughtWin;
            }
            print('Winner is ${winner!.name}, score: ${winner!.score}');
            Get.toNamed('winner');
          }
        }
      }
    }
  }

  nextRound() {
    state = GameState.playing;
    board.reset();
    winner = null;
    currentPlayer = player1;
    roundCount++;
  }

  showWinner(Seed seed) {
    if (seed == Seed.cross) {
      winner = player1;
      state = GameState.stop;
      print('Winner is ${winner!.name}');
      Get.toNamed('winner');
    }
    if (seed == Seed.nought) {
      winner = player2;
      state = GameState.stop;
      print('Winner is ${winner!.name}');
      Get.toNamed('winner');
    }
  }

  @override
  String toString() {
    return '''Game
    State: $state,
    Player 1: $player1, 
    Player 2: $player2,
    Current player: $currentPlayer, 
    Winner: $winner,
    Board: $board''';
  }
}
