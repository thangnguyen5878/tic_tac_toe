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
  Id id = Isar.autoIncrement;

  String name;

  @Enumerated(EnumType.name)
  late GameState state;

  Board board;

  Board historyBoard;

  List<Round?>? rounds;

  int currentRoundIndex;

  int currentHistoryRoundIndex;

  @ignore
  List<Cell>? checkingCells = List<Cell>.empty(growable: true);

  final winCount = 5;

  Room({Player? player1, Player? player2})
      : name = 'Untitled Room',
        board = Board(),
        historyBoard = Board(),
        currentHistoryRoundIndex = 0,
        state = GameState.playing,
        currentRoundIndex = 0 {
    rounds = [
      Round(number: 1, players: [
        Player(name: 'Player 1', seed: Seed.cross, score: 0),
        Player(name: 'Player 2', seed: Seed.nought, score: 0)
      ])
    ];
  }

  Round getCurrentRound() {
    return rounds![currentRoundIndex]!;
  }

  Round getCurrentHistoryRound() {
    return rounds![currentHistoryRoundIndex]!;
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

  /// Scan the board to check the winner.
  /// - If a winner found, move to `Winner Screen` to notify the winner
  /// - If no winner found, move to the next turn
  checkWinner() {
    print('check winner...');
    Player player1 = getCurrentRound().players![0];
    Player player2 = getCurrentRound().players![1];

    // Case 1: Multiple seeds in a row
    for (int i = 0; i < board.rowCount!; i++) {
      for (int j = 0; j <= board.columnCount! - winCount; j++) {
        // checking continuous cells if they are the same
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i][j + k]);
        }
        if (isWinningRow(checkingCells!) &&
            // ignore: unrelated_type_equality_checks
            board.cells[i][j].content != '') {
          // Case 1.1: X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (getCurrentRound().winnerIndex == null) {
              player1.score = player1.score! + 1;
            }
            getCurrentRound().winnerIndex = 0;
            player1.finalScore = player1.score;
            player2.finalScore = player2.score;
            getCurrentRound().winTurnIndex = getCurrentRound().turns.length - 1;
            state = GameState.stop;
            // color the winning cells
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i][j + offset].state = CellState.crossWin;
            }
            // log winner
            Player? winner = getCurrentRound().getWinner();
            print('Winner is ${winner.name}');
            print('rounds: $rounds');

            // notify about the winner
            Get.toNamed('winner');
            // Case 1.2: O wins
            if (board.cells[i][j].content == Seed.nought) {
              if (getCurrentRound().winnerIndex == null) {
                player2.score = player2.score! + 1;
              }
              getCurrentRound().winnerIndex = 1;
              player1.finalScore = player1.score;
              player2.finalScore = player2.score;
              getCurrentRound().winTurnIndex = getCurrentRound().turns.length - 1;
              state = GameState.stop;
              // color the winning cells
              for (int offset = 0; offset < winCount; offset++) {
                board.cells[i][j + offset].state = CellState.noughtWin;
              }
              // log winner
              Player? winner = getCurrentRound().getWinner();
              print('Winner is ${winner.name}');
              print('rounds: $rounds');

              // notify about the winner
              Get.toNamed('winner');
            }
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
        if (isWinningRow(checkingCells!) &&
            board.cells[i][j].content != Seed.noSeed) {
          // Case 2.1: X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (getCurrentRound().winnerIndex == null) {
              player1.score = player1.score! + 1;
            }
            getCurrentRound().winnerIndex = 0;
            player1.finalScore = player1.score;
            player2.finalScore = player2.score;
            getCurrentRound().winTurnIndex = getCurrentRound().turns.length - 1;
            state = GameState.stop;
            // color the winning cells
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j].state = CellState.crossWin;
            }
            // log winner
            Player? winner = getCurrentRound().getWinner();
            print('Winner is ${winner.name}');
            print('rounds: $rounds');

            // notify about the winner
            Get.toNamed('winner');
          }
          // Case 2.2: O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (getCurrentRound().winnerIndex == null) {
              player2.score = player2.score! + 1;
            }
            getCurrentRound().winnerIndex = 1;
            player1.finalScore = player1.score;
            player2.finalScore = player2.score;
            getCurrentRound().winTurnIndex = getCurrentRound().turns.length - 1;
            state = GameState.stop;
            // color the winning cells
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j].state = CellState.noughtWin;
            }
            // log winner
            Player? winner = getCurrentRound().getWinner();
            print('Winner is ${winner.name}');
            print('rounds: $rounds');

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
        if (isWinningRow(checkingCells!) &&
            board.cells[i][j].content != Seed.noSeed) {
          // Case 3.1: X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (getCurrentRound().winnerIndex == null) {
              player1.score = player1.score! + 1;
            }
            getCurrentRound().winnerIndex = 0;
            player1.finalScore = player1.score;
            player2.finalScore = player2.score;
            getCurrentRound().winTurnIndex = getCurrentRound().turns.length - 1;
            state = GameState.stop;
            // color the winning cells
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j + offset].state = CellState.crossWin;
            }
            // log winner
            Player? winner = getCurrentRound().getWinner();
            print('Winner is ${winner.name}');
            print('rounds: $rounds');

            // notify about the winner
            Get.toNamed('winner');
          }
          // Case 3.2: O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (getCurrentRound().winnerIndex == null) {
              player2.score = player2.score! + 1;
            }
            getCurrentRound().winnerIndex = 1;
            player1.finalScore = player1.score;
            player2.finalScore = player2.score;
            getCurrentRound().winTurnIndex = getCurrentRound().turns.length - 1;
            state = GameState.stop;
            // color the winning cells
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j + offset].state = CellState.noughtWin;
            }
            // log winner
            Player? winner = getCurrentRound().getWinner();
            print('Winner is ${winner.name}');
            print('rounds: $rounds');

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
        if (isWinningRow(checkingCells!) &&
            board.cells[i][j].content != Seed.noSeed) {
          // Case 4.1: X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (getCurrentRound().winnerIndex == null) {
              player1.score = player1.score! + 1;
            }
            getCurrentRound().winnerIndex = 0;
            player1.finalScore = player1.score;
            player2.finalScore = player2.score;
            getCurrentRound().winTurnIndex = getCurrentRound().turns.length - 1;
            state = GameState.stop;
            // color the winning cells
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j - offset].state = CellState.crossWin;
            }
            // log winner
            Player? winner = getCurrentRound().getWinner();
            print('Winner is ${winner.name}');
            print('rounds: $rounds');

            // notify about the winner
            Get.toNamed('winner');
          }
          // Case 4.2: O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (getCurrentRound().winnerIndex == null) {
              player2.score = player2.score! + 1;
            }
            getCurrentRound().winnerIndex = 1;
            player1.finalScore = player1.score;
            player2.finalScore = player2.score;
            getCurrentRound().winTurnIndex = getCurrentRound().turns.length - 1;
            state = GameState.stop;
            // color the winning cells
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j - offset].state = CellState.noughtWin;
            }
            // log winner
            Player? winner = getCurrentRound().getWinner();
            print('Winner is ${winner.name}');
            print('rounds: $rounds');

            // notify about the winner
            Get.toNamed('winner');
          }
        }
      }
    }
    // if there is no winner in this round, move to the next turn
    if (getCurrentRound().winnerIndex == null) {
      getCurrentRound().nextTurn();
    }
  }

  /// Move to the next round when a player wins and the player press the `Next round button`
  void nextRound() {
    // reset the game
    state = GameState.playing;
    board.reset();
    // move to the next round
    Round nextRound = Round.cloneNextRound(getCurrentRound());
    // rounds = [...?rounds, nextRound];
    rounds!.add(nextRound);
    currentRoundIndex++;
  }

  /// Reset game to the original state
  void reset() {
    state = GameState.playing;
    board.reset();
    getCurrentRound().reset();
  }

  /// Load cell from turns to history board according to historyCurrentTurnIndex
  void updateHistoryBoard() {
    historyBoard.reset();
    final turns = getCurrentHistoryRound().turns;
    final currentHistoryTurnIndex = getCurrentHistoryRound().currentHistoryTurnIndex!;
    print('Turns: $turns');
    if (currentHistoryTurnIndex >= 0) {
      historyBoard.load(turns, currentHistoryTurnIndex);
    }
  }

  @override
  String toString() {
    return 'Room{name: $name, board: $board, historyBoard: $historyBoard, historyRoundIndex: $currentHistoryRoundIndex, state: $state, rounds: $rounds, currentRoundIndex: $currentRoundIndex, checkingCells: $checkingCells, winCount: $winCount}';
  }
}
