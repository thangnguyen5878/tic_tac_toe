// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
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
  Id? id = Isar.autoIncrement;

  String name;

  @Enumerated(EnumType.name)
  late GameState state;

  Board board;

  Board historyBoard;

  List<Round?>? rounds;

  int currentRoundIndex;

  int historyRoundIndex;

  @ignore
  List<Cell>? checkingCells = List<Cell>.empty(growable: true);

  final winCount = 5;

  Room({Player? player1, Player? player2})
      : name = 'Untitled Room',
        board = Board(),
        historyBoard = Board(),
        historyRoundIndex = 0,
        state = GameState.playing,
        currentRoundIndex = 0 {
    rounds = [
      Round(number: 1)
    ];
  }

  // getters
  int get roundCount {
    return currentRoundIndex + 1;
  }

  Round get currentRound {
    return rounds![currentRoundIndex]!;
  }

  // getters history
  Round get historyRound {
    return rounds![historyRoundIndex]!;
  }

  int get historyRoundCount {
    return historyRoundIndex + 1;
  }

  /// Check whether adjacent cells are the same or not to check the winner
  isWinningRow(List<Cell> list) {
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

  void handleWin(int winnerIndex) {
    Player player1 = currentRound.players![0];
    Player player2 = currentRound.players![1];

    if (winnerIndex == 0) {
      player1.score = player1.score! + 1;
      colorWinningCells(CellState.crossWin);
    } else {
      player2.score = player2.score! + 1;
      colorWinningCells(CellState.noughtWin);
    }

    currentRound.winnerIndex = winnerIndex;
    player1.finalScore = player1.score;
    player2.finalScore = player2.score;
    currentRound.winTurnIndex = currentRound.turns.length - 1;
    state = GameState.stop;

    logWinnerAndNotify();
  }

  /// This method will be used to color the winning cells.
  void colorWinningCells(CellState winningState) {
    for (Cell cell in checkingCells!) {
      cell.state = winningState;
    }
  }

  /// This method will log the winner and navigate to the winner screen.
  void logWinnerAndNotify() {
    Player? winner = currentRound.winner;
    print('Winner is ${winner.name}');
    // print('rounds: $rounds');
    Get.toNamed('winner');
  }

  /// This method checks if there's a winner and handles the case.
  bool checkForWinner(List<Cell> cellsToCheck, Seed seed) {
    if (isWinningRow(cellsToCheck)) {
      handleWin(seed == Seed.cross ? 0 : 1);
      return true;
    }
    return false;
  }

  void checkWinner() {
    if (checkLines() || checkColumns() || checkDiagonals()) {
      return; // Winner found and handled
    }
    // If no winner, move to next turn
    currentRound.nextTurn();
  }

  bool checkLines() {
    for (int row = 0; row < board.rowCount!; row++) {
      for (int col = 0; col <= board.columnCount! - winCount; col++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[row][col + k]);
        }
        // Check if the first cell is not noSeed before checking for winner
        if (board.cells[row][col].content != Seed.noSeed &&
            checkForWinner(checkingCells!, board.cells[row][col].content!)) {
          return true;
        }
      }
    }
    return false;
  }

  bool checkColumns() {
    for (int col = 0; col < board.columnCount!; col++) {
      for (int row = 0; row <= board.rowCount! - winCount; row++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[row + k][col]);
        }
        // Check if the first cell is not noSeed before checking for winner
        if (board.cells[row][col].content != Seed.noSeed &&
            checkForWinner(checkingCells!, board.cells[row][col].content!)) {
          return true;
        }
      }
    }
    return false;
  }

  bool checkDiagonals() {
    // Check descending diagonal (\)
    for (int row = 0; row <= board.rowCount! - winCount; row++) {
      for (int col = 0; col <= board.columnCount! - winCount; col++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[row + k][col + k]);
        }
        if (board.cells[row][col].content != Seed.noSeed &&
            checkForWinner(checkingCells!, board.cells[row][col].content!)) {
          return true;
        }
      }
    }

    // Check ascending diagonal (/)
    for (int row = 0; row <= board.rowCount! - winCount; row++) {
      for (int col = winCount - 1; col < board.columnCount!; col++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[row + k][col - k]);
        }
        if (board.cells[row][col].content != Seed.noSeed &&
            checkForWinner(checkingCells!, board.cells[row][col].content!)) {
          return true;
        }
      }
    }
    return false;
  }

  /// Move to the next round when a player wins and the player press the `Next round button`
  void nextRound() {
    state = GameState.playing;
    board.reset();

    Round nextRound = Round.cloneNextRound(currentRound);
    // print('next round: $nextRound');
    rounds!.add(nextRound);
    currentRoundIndex++;
    // print('nextRound()\n');
    // print('current round: ${rounds![currentRoundIndex - 1]}\n');
    // print('next round: ${rounds![currentRoundIndex]}\n');
  }

  /// Reset game to the original state
  void reset() {
    state = GameState.playing;
    board.reset();
    currentRound.reset();
  }

  /// Load cell from turns to history board according to historyCurrentTurnIndex
  void updateHistoryBoard() {
    historyBoard.reset();
    final turns = historyRound.turns;
    final currentHistoryTurnIndex = historyRound.historyTurnIndex;
    // print('Turns: $turns');
    if (currentHistoryTurnIndex >= 0) {
      historyBoard.load(turns, currentHistoryTurnIndex);
    }
  }

  @override
  String toString() {
    return 'Room{id: $id, name: $name, state: $state, board: $board, historyBoard: $historyBoard, rounds: $rounds, currentRoundIndex: $currentRoundIndex, historyRoundIndex: $historyRoundIndex, checkingCells: $checkingCells, winCount: $winCount}';
  }
}
