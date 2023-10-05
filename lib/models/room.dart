import 'package:flutter_tic_tac_toe/models/board.dart';
import 'package:flutter_tic_tac_toe/models/cell.dart';
import 'package:flutter_tic_tac_toe/models/player.dart';
import 'package:flutter_tic_tac_toe/models/round.dart';
import 'package:flutter_tic_tac_toe/utils/cell_state.dart';
import 'package:flutter_tic_tac_toe/utils/game_state.dart';
import 'package:flutter_tic_tac_toe/utils/seed.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:isar/isar.dart';
part 'room.g.dart';

@collection
class Room {
  Id id = Isar.autoIncrement;

  String name;

  List<Player> players;

  late Player currentPlayer;

  Board board;

  @Enumerated(EnumType.name)
  late GameState state;

  List<Round?>? rounds;

  int roundCount;

  Round currentRound;

  @ignore
  List<Cell>? checkingCells = List<Cell>.empty(growable: true);

  final winCount = 5;

  Room({Player? player1, Player? player2})
      : name = 'Unttited Room',
        players = [
          Player(name: 'Player 1', seed: Seed.cross, score: 0),
          Player(name: 'Player 2', seed: Seed.nought, score: 0)
        ],
        board = Board(),
        roundCount = 1,
        state = GameState.playing,
        currentRound = Round(number: 1, turnCount: 1) {
    rounds = [Round(number: 1, turnCount: 1)];
    currentPlayer = this.players[0];
  }

  /// When draw Seed at a cell, automatically change to next turn.
  /// - Change the player when the board move to next turn (player 1 -> player 2, player 2 -> player 1)
  /// - Increment turnCount
  void nextTurn() {
    if (currentPlayer.seed == Seed.cross) {
      currentPlayer = players[1];
      currentRound.turnCount = currentRound.turnCount! + 1;
    } else {
      currentPlayer = players[0];
      currentRound.turnCount = currentRound.turnCount! + 1;
    }
    print('next turn, currentplayer: ${currentPlayer.name}');
  }

  /// Check whether adjacent cells are the same or not to check the winner
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

  /// Scan the board to check the winner.
  /// - If a winner found, move to `Winner Screen` to notify the winner
  /// - If no winner found, move to the next turn
  void checkWinner() {
    print('check winner...');
    // Case 1: Multiple seeds in a row
    for (int i = 0; i < board.rowCount!; i++) {
      for (int j = 0; j <= board.columnCount! - winCount; j++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i][j + k]!);
        }
        if (areAllCellContentEqual(checkingCells!) &&
            board.cells[i][j]?.content != '') {
          // Case 1.1: X wins
          if (board.cells[i][j]?.content == Seed.cross) {
            if (currentRound.winnerIndex == null) {
              players[0].score = players[0].score! + 1;
            }
            currentRound.winnerIndex = 0;
            state = GameState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i][j + offset]?.state = CellState.crossWin;
            }
            print(
                'Winner is ${players[currentRound.winnerIndex!].name}, score: ${players[currentRound.winnerIndex!].score}');
            // print(
            // 'Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            currentRound.scores[0]++;
            Get.toNamed('winner');
          }
          // Case 1.2: O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (currentRound.winnerIndex == null) {
              players[1].score = players[1].score! + 1;
            }
            currentRound.winnerIndex = 1;
            state = GameState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i][j + offset].state = CellState.noughtWin;
            }
            print(
                'Winner is ${players[currentRound.winnerIndex!].name}, score: ${players[currentRound.winnerIndex!].score}');
            currentRound.scores[1]++;
            Get.toNamed('winner');
          }
        }
      }
    }
    // Case 2: Multiple seeds in a column
    for (int j = 0; j < board.columnCount!; j++) {
      for (int i = 0; i <= board.rowCount! - winCount; i++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i + k][j]);
        }
        if (areAllCellContentEqual(checkingCells!) &&
            board.cells[i][j].content != '') {
          // Case 2.1: X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (currentRound.winnerIndex == null) {
              players[0].score = players[0].score! + 1;
            }
            currentRound.winnerIndex = 0;
            state = GameState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j].state = CellState.crossWin;
            }
            print(
                'Winner is ${players[currentRound.winnerIndex!].name}, score: ${players[currentRound.winnerIndex!].score}');
            print(
                'Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            currentRound.scores[0]++;
            Get.toNamed('winner');
          }
          // Case 2.2: O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (currentRound.winnerIndex == null) {
              players[1].score = players[1].score! + 1;
            }
            currentRound.winnerIndex = 1;
            state = GameState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j].state = CellState.noughtWin;
            }
            print(
                'Winner is ${players[currentRound.winnerIndex!].name}, score: ${players[currentRound.winnerIndex!].score}');
            currentRound.scores[1]++;
            Get.toNamed('winner');
          }
        }
      }
    }
    // Case 3: Multiple seeds in a diagonal "\"
    for (int i = 0; i <= board.rowCount! - winCount; i++) {
      for (int j = 0; j <= board.columnCount! - winCount; j++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i + k][j + k]);
        }
        if (areAllCellContentEqual(checkingCells!) &&
            board.cells[i][j].content != '') {
          // Case 3.1: X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (currentRound.winnerIndex == null) {
              players[0].score = players[0].score! + 1;
            }
            currentRound.winnerIndex = 0;
            state = GameState.stop;
            // update cell state to change the cell color
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j + offset].state = CellState.crossWin;
            }
            print(
                'Winner is ${players[currentRound.winnerIndex!].name}, score: ${players[currentRound.winnerIndex!].score}');
            // print('Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            currentRound.scores[0]++;
            Get.toNamed('winner');
          }
          // Case 3.2: O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (currentRound.winnerIndex == null) {
              players[1].score = players[1].score! + 1;
            }
            currentRound.winnerIndex = 1;
            state = GameState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j + offset].state = CellState.noughtWin;
            }
            print(
                'Winner is ${players[currentRound.winnerIndex!].name}, score: ${players[currentRound.winnerIndex!].score}');
            currentRound.scores[1]++;
            Get.toNamed('winner');
          }
        }
      }
    }
    // Case 4: Multiple seeds in a diagonal "/"
    for (int i = 0; i <= board.rowCount! - winCount; i++) {
      for (int j = winCount - 1; j < board.columnCount!; j++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i + k][j - k]);
        }
        if (areAllCellContentEqual(checkingCells!) &&
            board.cells[i][j].content != '') {
          // Case 4.1: X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (currentRound.winnerIndex == null) {
              players[0].score = players[0].score! + 1;
            }
            currentRound.winnerIndex = 0;
            state = GameState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j - offset].state = CellState.crossWin;
            }
            print(
                'Winner is ${players[currentRound.winnerIndex!].name}, score: ${players[currentRound.winnerIndex!].score}');
            // print('Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            currentRound.scores[0]++;
            Get.toNamed('winner');
          }
          // Case 4.2: O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (currentRound.winnerIndex == null) {
              players[1].score = players[1].score! + 1;
            }
            currentRound.winnerIndex = 1;
            state = GameState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j - offset].state = CellState.noughtWin;
            }
            print(
                'Winner is ${players[currentRound.winnerIndex!].name}, score: ${players[currentRound.winnerIndex!].score}');
            currentRound.scores[1]++;
            Get.toNamed('winner');
          }
        }
      }
    }
    if (currentRound.winnerIndex == null) {
      nextTurn();
    }
  }

  /// Move to the next round when a player wins and the player press the `Next round button`
  nextRound() {
    state = GameState.playing;
    board.reset();
    currentRound.winnerIndex = null;
    currentPlayer = players[0];
    roundCount++;
    currentRound = Round(number: roundCount, turnCount: 1);
    rounds = [...?rounds, currentRound];
  }

  reset() {
    state = GameState.playing;
    board.reset();
    currentRound.reset();
  }

  // showWinner(Seed seed) {
  //   if (seed == Seed.cross) {
  //     currentRound.winner = player1;
  //     state = GameState.stop;
  //     print('Winner is ${currentRound.winner!.name}');
  //     Get.toNamed('winner');
  //   }
  //   if (seed == Seed.nought) {
  //     currentRound.winner = player2;
  //     state = GameState.stop;
  //     print('Winner is ${currentRound.winner!.name}');
  //     Get.toNamed('winner');
  //   }
  // }

  // @override
  // String toString() {
  //   return '''Game
  //   State: $sta,
  //   Player 1: $player1,
  //   Player 2: $player2,
  //   Current player: $currentPlayer,
  //   Rounds: $rounds,
  //   Board: $board''';
  // }

  @override
  String toString() {
    return 'Room(players: $players, currentPlayer: $currentPlayer, board: $board, state: $state, rounds: $rounds, roundCount: $roundCount, currentRound: $currentRound, checkingCells: $checkingCells)';
  }
}
