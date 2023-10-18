// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:isar/isar.dart';

import 'package:flutter_tic_tac_toe/models/board.dart';
import 'package:flutter_tic_tac_toe/models/cell.dart';
import 'package:flutter_tic_tac_toe/models/player.dart';
import 'package:flutter_tic_tac_toe/models/round.dart';
import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/game_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';

part 'room.g.dart';

@collection
class Room {
  Id id = Isar.autoIncrement;

  String name;

  Board board;

  @Enumerated(EnumType.name)
  late GameState state;

  List<Round?>? rounds;

  int roundCount;

  late Round currentRound;

  @ignore
  List<Cell>? checkingCells = List<Cell>.empty(growable: true);

  final winCount = 5;

  Room({Player? player1, Player? player2})
      : name = 'Unttited Room',
        board = Board(),
        roundCount = 1,
        state = GameState.playing {
    currentRound = Round(number: 1, turnCount: 1, players: [
      Player(name: 'Player 1', seed: Seed.cross, score: 0),
      Player(name: 'Player 2', seed: Seed.nought, score: 0)
    ]);
    rounds = [currentRound];
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
    final player1 = currentRound.players![0];
    final player2 = currentRound.players![1];
    
    // Case 1: Multiple seeds in a row
    for (int i = 0; i < board.rowCount!; i++) {
      for (int j = 0; j <= board.columnCount! - winCount; j++) {
        // checking continuous cells if they are the same
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i][j + k]!);
        }
        if (areAllCellContentEqual(checkingCells!) &&
            board.cells[i][j].content != '') {
          // Case 1.1: X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (currentRound.winnerIndex == null) {
              player1.score = player1.score! + 1;
            }
            currentRound.winnerIndex = 0;
            state = GameState.stop;
            // color the winning cells
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i][j + offset].state = CellState.crossWin;
            }
            // log winner
            Player? winner = currentRound.players![currentRound.winnerIndex!];
            print('Winner is ${winner.name}, score: ${winner.score}');
            // print('Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            // notify about the winner
            Get.toNamed('winner');
          }
          // Case 1.2: O wins
          if (board.cells[i][j].content == Seed.nought) {          
            if (currentRound.winnerIndex == null) {
              player2.score = player2.score! + 1;
            }
            currentRound.winnerIndex = 1;
            state = GameState.stop;
            // color the winning cells
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i][j + offset].state = CellState.noughtWin;
            }
            // log winner
            Player? winner = currentRound.players![currentRound.winnerIndex!];
            print('Winner is ${winner.name}, score: ${winner.score}');
            // print('Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            // notify about the winner
            Get.toNamed('winner');
          }
        }
      }
    }
    // Case 2: Multiple seeds in a column
    for (int j = 0; j < board.columnCount!; j++) {
      for (int i = 0; i <= board.rowCount! - winCount; i++) {
        // checking continuous cells if they are the same
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i + k][j]);
        }
        if (areAllCellContentEqual(checkingCells!) &&
            board.cells[i][j].content != '') {
          // Case 2.1: X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (currentRound.winnerIndex == null) {
              player1.score = player1.score! + 1;
            }
            currentRound.winnerIndex = 0;
            state = GameState.stop;
            // color the winning cells
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j].state = CellState.crossWin;
            }
            // log winner
            Player? winner = currentRound.players![currentRound.winnerIndex!];
            print('Winner is ${winner.name}, score: ${winner.score}');
            // print('Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            // notify about the winner
            Get.toNamed('winner');
          }
          // Case 2.2: O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (currentRound.winnerIndex == null) {
              player2.score = player2.score! + 1;
            }
            currentRound.winnerIndex = 1;
            state = GameState.stop;
            // color the winning cells
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j].state = CellState.noughtWin;
            }
            // log winner
            Player? winner = currentRound.players![currentRound.winnerIndex!];
            print('Winner is ${winner.name}, score: ${winner.score}');
            // print('Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            // notify about the winner
            Get.toNamed('winner');
          }
        }
      }
    }
    // Case 3: Multiple seeds in a diagonal "\"
    for (int i = 0; i <= board.rowCount! - winCount; i++) {
      for (int j = 0; j <= board.columnCount! - winCount; j++) {
        // checking continuous cells if they are the same
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i + k][j + k]);
        }
        if (areAllCellContentEqual(checkingCells!) &&
            board.cells[i][j].content != '') {
          // Case 3.1: X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (currentRound.winnerIndex == null) {
              player1.score = player1.score! + 1;
            }
            currentRound.winnerIndex = 0;
            state = GameState.stop;
            // color the winning cells
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j + offset].state = CellState.crossWin;
            }
            // log winner
            Player? winner = currentRound.players![currentRound.winnerIndex!];
            print('Winner is ${winner.name}, score: ${winner.score}');
            // print('Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            // notify about the winner
            Get.toNamed('winner');
          }
          // Case 3.2: O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (currentRound.winnerIndex == null) {
              player2.score = player2.score! + 1;
            }
            currentRound.winnerIndex = 1;
            state = GameState.stop;
            // color the winning cells
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j + offset].state = CellState.noughtWin;
            }
            // log winner
            Player? winner = currentRound.players![currentRound.winnerIndex!];
            print('Winner is ${winner.name}, score: ${winner.score}');
            // print('Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            // notify about the winner
            Get.toNamed('winner');
          }
        }
      }
    }
    // Case 4: Multiple seeds in a diagonal "/"
    for (int i = 0; i <= board.rowCount! - winCount; i++) {
      for (int j = winCount - 1; j < board.columnCount!; j++) {
        // checking continuous cells if they are the same
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i + k][j - k]);
        }
        if (areAllCellContentEqual(checkingCells!) &&
            board.cells[i][j].content != '') {
          // Case 4.1: X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (currentRound.winnerIndex == null) {
              player1.score = player1.score! + 1;
            }
            currentRound.winnerIndex = 0;
            state = GameState.stop;
            // color the winning cells
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j - offset].state = CellState.crossWin;
            }
            // log winner
            Player? winner = currentRound.players![currentRound.winnerIndex!];
            print('Winner is ${winner.name}, score: ${winner.score}');
            // print('Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            // notify about the winner
            Get.toNamed('winner');
          }
          // Case 4.2: O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (currentRound.winnerIndex == null) {
              player2.score = player2.score! + 1;
            }
            currentRound.winnerIndex = 1;
            state = GameState.stop;
            // color the winning cells
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j - offset].state = CellState.noughtWin;
            }
            // log winner
            Player? winner = currentRound.players![currentRound.winnerIndex!];
            print('Winner is ${winner.name}, score: ${winner.score}');
            // print('Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            // notify about the winner
            Get.toNamed('winner');
          }
          }
      }
    }
    // if there is no winner in this round, move to the next turn
    if (currentRound.winnerIndex == null) {
      currentRound.nextTurn();
    }
  }

  /// Move to the next round when a player wins and the player press the `Next round button`
  nextRound() {
    // reset the game
    state = GameState.playing;
    board.reset();
    // move to the next round
    roundCount++;
    currentRound = Round(number: roundCount, turnCount: 1, players: currentRound.players);
    currentRound.winnerIndex = null;
    rounds = [...?rounds, currentRound];
  }

  reset() {
    state = GameState.playing;
    board.reset();
    currentRound.reset();
  }

  @override
  String toString() {
    return 'Room(id: $id, name: $name, board: $board, state: $state, rounds: $rounds, roundCount: $roundCount, currentRound: $currentRound)';
  }
}
