import 'package:get/get.dart';
import 'package:tic_tac_toe/models/board.dart';
import 'package:tic_tac_toe/models/cell.dart';
import 'package:tic_tac_toe/models/player.dart';
import 'package:tic_tac_toe/models/round.dart';
import 'package:tic_tac_toe/utils/cell_state.dart';
import 'package:tic_tac_toe/utils/round_state.dart';
import 'package:tic_tac_toe/utils/seed.dart';

class Game {
  Player player1;
  Player player2;
  late Player currentPlayer;
  Board board;
  int roundCount;
  List<Round?>? rounds;
  Round currentRound;
  final winCount = 5;
  List<Cell>? checkingCells = [];

  Game({Player? player1, Player? player2})
      : player1 = player1 ?? Player('Player 1', Seed.cross),
        player2 = player2 ?? Player('Player 2', Seed.nought),
        board = Board(),
        roundCount = 1,
        currentRound = Round(1) {
    currentPlayer = this.player1;
    currentRound.state = RoundState.playing;
    rounds?.add(currentRound);
  }

  void nextTurn() {
    if (currentPlayer.seed == Seed.cross) {
      currentPlayer = player2;
      currentRound.turnCount++;
    } else {
      currentPlayer = player1;
      currentRound.turnCount++;
    }
    print('next turn, currentplayer: ${currentPlayer.name}');
  }

  // void reset() {
  //   currentPlayer = player1;
  //   player1 = Player('Player 1', Seed.cross);
  //   player2 = Player('Player 2', Seed.nought);
  //   currentRound.state = RoundState.playing;
  //   currentRound.number = 0;
  //   roundCount = 1;
  //   rounds?.clear();
  //   board = Board();
  //   // print('reset player');
  //   // print('Current player: $currentPlayer');
  //   // print('Player 1: ${player1.name}');
  //   // print('Player 2: ${player2.name}');
  // }

  bool areAllCellContentEqual(List<Cell> list) {
    if (list.isEmpty) {
      return false;
    }
    dynamic firstElement = list[0].content;
    for (int i = 1; i < list.length; i++) {
      if (list[i].content != firstElement) {
        return false;
      }
    }
    return true;
  }

  void checkWinner() {
    print('check winner...');
    // 5 seeds in a row
    for (int i = 0; i < board.rows; i++) {
      for (int j = 0; j <= board.columns - winCount; j++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i][j + k]);
        }
        if (areAllCellContentEqual(checkingCells!) && board.cells[i][j].content != '') {
          // X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (currentRound.winner == null) {
              player1.score++;
            }
            currentRound.winner = player1;
            currentRound.state = RoundState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i][j + offset].state = CellState.crossWin;
            }
            print('Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            // print(
            // 'Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            Get.toNamed('winner');
          }
          // O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (currentRound.winner == null) {
              player2.score++;
            }
            currentRound.winner = player2;
            currentRound.state = RoundState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i][j + offset].state = CellState.noughtWin;
            }
            print('Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            Get.toNamed('winner');
          }
        }
      }
    }
    // 5 seeds in a column
    for (int j = 0; j < board.columns; j++) {
      for (int i = 0; i <= board.rows - winCount; i++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i + k][j]);
        }
        if (areAllCellContentEqual(checkingCells!) && board.cells[i][j].content != '') {
          // X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (currentRound.winner == null) {
              player1.score++;
            }
            currentRound.winner = player1;
            currentRound.state = RoundState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j].state = CellState.crossWin;
            }
            print('Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            print(
                'Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            Get.toNamed('winner');
          }
          // O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (currentRound.winner == null) {
              player2.score++;
            }
            currentRound.winner = player2;
            currentRound.state = RoundState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j].state = CellState.noughtWin;
            }
            print('Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            Get.toNamed('winner');
          }
        }
      }
    }
    // 3 seeds in a diagonal type: \
    for (int i = 0; i <= board.rows - winCount; i++) {
      for (int j = 0; j <= board.columns - winCount; j++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i + k][j + k]);
        }
        if (areAllCellContentEqual(checkingCells!) && board.cells[i][j].content != '') {
          // X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (currentRound.winner == null) {
              player1.score++;
            }
            currentRound.winner = player1;
            currentRound.state = RoundState.stop;
            // update cell state to change the cell color
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j + offset].state = CellState.crossWin;
            }
            print('Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            // print('Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            Get.toNamed('winner');
          }
          // O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (currentRound.winner == null) {
              player2.score++;
            }
            currentRound.winner = player2;
            currentRound.state = RoundState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j + offset].state = CellState.noughtWin;
            }
            print('Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            Get.toNamed('winner');
          }
        }
      }
    }
    // 3 seeds in a diagonal type: /
    for (int i = 0; i <= board.rows - winCount; i++) {
      for (int j = winCount - 1; j < board.columns; j++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i + k][j - k]);
        }
        if (areAllCellContentEqual(checkingCells!) && board.cells[i][j].content != '') {
          // X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (currentRound.winner == null) {
              player1.score++;
            }
            currentRound.winner = player1;
            currentRound.state = RoundState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j - offset].state = CellState.crossWin;
            }
            print('Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            // print('Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            Get.toNamed('winner');
          }
          // O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (currentRound.winner == null) {
              player2.score++;
            }
            currentRound.winner = player2;
            currentRound.state = RoundState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j - offset].state = CellState.noughtWin;
            }
            print('Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            Get.toNamed('winner');
          }
        }
      }
    }
  }

  nextRound() {
    currentRound.state = RoundState.playing;
    board.reset();
    currentRound.winner = null;
    currentPlayer = player1;
    roundCount++;
    currentRound = Round(roundCount);
    rounds?.add(currentRound);
  }

  showWinner(Seed seed) {
    if (seed == Seed.cross) {
      currentRound.winner = player1;
      currentRound.state = RoundState.stop;
      print('Winner is ${currentRound.winner!.name}');
      Get.toNamed('winner');
    }
    if (seed == Seed.nought) {
      currentRound.winner = player2;
      currentRound.state = RoundState.stop;
      print('Winner is ${currentRound.winner!.name}');
      Get.toNamed('winner');
    }
  }

  @override
  String toString() {
    return '''Game
    State: $currentRound.state,
    Player 1: $player1, 
    Player 2: $player2,
    Current player: $currentPlayer, 
    Rounds: $rounds,
    Board: $board''';
  }
}
