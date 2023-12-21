import 'package:flutter_tic_tac_toe/models/online/online_board.dart';
import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
import 'package:flutter_tic_tac_toe/models/online/online_player.dart';
import 'package:flutter_tic_tac_toe/models/online/online_round.dart';
import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/game_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'online_room.g.dart';

@JsonSerializable(explicitToJson: true)
class OnlineRoom {
  String id = '';
  String name;
  late GameState state;
  OnlineBoard board;
  OnlineBoard historyBoard;

  // @NestedOnlineRoundListConverter()
  List<OnlineRound?>? rounds;

  int currentRoundIndex;
  int historyRoundIndex;

  // @NestedOnlineCellListConverter()
  List<OnlineCell>? checkingCells = List<OnlineCell>.empty(growable: true);

  final winCount = 5;

  // @DocumentReferenceConverter()
  // DocumentReference<Map<String, dynamic>>? roomRef;

  OnlineRoom.all({
    required this.id,
    required this.name,
    required this.state,
    required this.board,
    required this.historyBoard,
    this.rounds,
    required this.currentRoundIndex,
    required this.historyRoundIndex,
    this.checkingCells,
  });

  OnlineRoom({OnlinePlayer? player1, OnlinePlayer? player2})
      : name = 'Untitled Room',
        board = OnlineBoard(),
        historyBoard = OnlineBoard(),
        historyRoundIndex = 0,
        state = GameState.playing,
        currentRoundIndex = 0 {
    rounds = [
      OnlineRound(index: 0, players: [
        OnlinePlayer(index: 0, name: 'Player 1', seed: Seed.cross, score: 0),
        OnlinePlayer(index: 1, name: 'Player 2', seed: Seed.nought, score: 0)
      ])
    ];
  }

  // getters
  OnlineRound getCurrentRound() {
    return rounds![currentRoundIndex]!;
  }

  int getRoundCount() {
    return currentRoundIndex + 1;
  }

  // getters history
  OnlineRound getHistoryRound() {
    return rounds![historyRoundIndex]!;
  }

  int getHistoryRoundCount() {
    return historyRoundIndex + 1;
  }

  // check methods
  bool isGameOver() {
    return state == GameState.stop;
  }

  /// Check whether adjacent cells are the same or not to check the winner
  bool isWinningRow(List<OnlineCell> list) {
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
    var player1 = getCurrentRound().players![0];
    var player2 = getCurrentRound().players![1];

    if (winnerIndex == 0) {
      player1.score = player1.score! + 1;
      colorWinningCells(CellState.crossWin);
    } else {
      player2.score = player2.score! + 1;
      colorWinningCells(CellState.noughtWin);
    }

    getCurrentRound().winnerIndex = winnerIndex;
    player1.finalScore = player1.score;
    player2.finalScore = player2.score;
    getCurrentRound().winTurnIndex = getCurrentRound().turns.length - 1;
    state = GameState.stop;

    logWinnerAndNotify();
  }

  /// This method will be used to color the winning cells.
  void colorWinningCells(CellState winningState) {
    for (OnlineCell cell in checkingCells!) {
      cell.state = winningState;
    }
  }

  /// This method will log the winner and navigate to the winner screen.
  void logWinnerAndNotify() {
    print('Winner is ${getCurrentRound().getWinner()}');
    // print('rounds: $rounds');
    Get.toNamed('winner');
  }

  /// This method checks if there's a winner and handles the case.
  bool checkForWinner(List<OnlineCell> cellsToCheck, Seed seed) {
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
    getCurrentRound().nextTurn();
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
    // reset the game
    state = GameState.playing;
    board.reset();

    // move to the next round
    var nextRound = OnlineRound.cloneNextRound(getCurrentRound());
    rounds = [...?rounds, nextRound];
    currentRoundIndex++;
    // print('nextRound()\n');
    // print('current round: ${rounds![currentRoundIndex - 1]}\n');
    // print('next round: ${rounds![currentRoundIndex]}\n');
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
    final turns = getHistoryRound().turns;
    final currentHistoryTurnIndex = getHistoryRound().historyTurnIndex!;
    // print('Turns: $turns');
    if (currentHistoryTurnIndex >= 0) {
      historyBoard.load(turns, currentHistoryTurnIndex);
    }
  }

  factory OnlineRoom.fromJson(Map<String, dynamic> json) => _$OnlineRoomFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineRoomToJson(this);

  @override
  String toString() {
    return 'OnlineRoom{name: $name, board: $board, historyBoard: $historyBoard, historyRoundIndex: $historyRoundIndex, state: $state, rounds: $rounds, currentRoundIndex: $currentRoundIndex, checkingCells: $checkingCells, winCount: $winCount}';
  }

}
