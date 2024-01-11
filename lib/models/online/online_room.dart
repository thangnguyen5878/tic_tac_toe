import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/models/online/online_board.dart';
import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
import 'package:flutter_tic_tac_toe/models/online/online_player.dart';
import 'package:flutter_tic_tac_toe/models/online/online_round.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/game_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:flutter_tic_tac_toe/utils/json%20converters/online_round_list_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'online_room.g.dart';

@JsonSerializable(explicitToJson: true)
class OnlineRoom {
  String id;
  String name;
  GameState state;
  OnlineBoard board;
  OnlineBoard historyBoard;

  @OnlineRoundListConverter()
  List<OnlineRound?>? rounds;

  int currentRoundIndex;
  int historyRoundIndex;

  List<String?>? playerIds = [];

  @JsonKey(includeToJson: false, includeFromJson: false)
  List<OnlineCell>? checkingCells = List<OnlineCell>.empty(growable: true);

  @JsonKey(includeToJson: true, includeFromJson: true)
  final winCount = 5;

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

  OnlineRoom({OnlinePlayer? player1, OnlinePlayer? player2, String? player1Id, String? player2Id})
      : id = const Uuid().v4(),
        name = 'Untitled Room',
        board = OnlineBoard(),
        historyBoard = OnlineBoard(),
        historyRoundIndex = 0,
        state = GameState.playing,
        currentRoundIndex = 0 {
    playerIds = [player1Id ?? null, player2Id ?? null];
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

  Future<void> handleWin(int winnerIndex) async {
    logger.t('handle win');
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

    OnlineUserController.to.updateWinnerAndLoserStatus();
    OnlineGameController.to.pushRoomToFirebase();
  }

  /// This method will be used to color the winning cells.
  void colorWinningCells(CellState winningState) {
    for (OnlineCell cell in checkingCells!) {
      cell.state = winningState;
    }
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
    OnlineRound nextRound = OnlineRound.cloneNextRound(getCurrentRound());
    rounds = [...?rounds, nextRound];
    currentRoundIndex++;
  }

  /// Reset game to the original state
  void reset() {
    logger.t('reset game');
    state = GameState.playing;
    board.reset();
    getCurrentRound().reset();
  }

  /// Load cell from turns to history board according to historyCurrentTurnIndex
  void updateHistoryBoard() {
    historyBoard.reset();
    final turns = getHistoryRound().turns;
    final currentHistoryTurnIndex = getHistoryRound().historyTurnIndex!;
    // logger.t('Turns: $turns');
    if (currentHistoryTurnIndex >= 0) {
      historyBoard.load(turns, currentHistoryTurnIndex);
    }
  }

  // toJson() and fromJson()
  Map<String, dynamic> toJson() => _$OnlineRoomToJson(this);

  factory OnlineRoom.fromJson(Map<String, dynamic> json) => OnlineRoom()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..state = $enumDecode(_$GameStateEnumMap, json['state'])
    ..board = OnlineBoard.fromJson(json['board'] as Map<String, dynamic>)
    ..historyBoard = OnlineBoard.fromJson(json['historyBoard'] as Map<String, dynamic>)
    ..rounds = _$JsonConverterFromJson<List<Map<String, dynamic>>, List<OnlineRound?>>(
        List<Map<String, dynamic>>.from(json['rounds']), const OnlineRoundListConverter().fromJson)
    ..currentRoundIndex = json['currentRoundIndex'] as int
    ..historyRoundIndex = json['historyRoundIndex'] as int
    ..playerIds = (json['playerIds'] as List<dynamic>?)?.map((e) => e as String?).toList();

  @override
  String toString() {
    return 'OnlineRoom{id: $id, name: $name, state: $state, board: $board, historyBoard: $historyBoard, \nrounds: $rounds, currentRoundIndex: $currentRoundIndex, historyRoundIndex: $historyRoundIndex, checkingCells: $checkingCells, winCount: $winCount}';
  }

  String toShortString() {
    return 'OnlineRoom{id: $id, name: $name}';
  }
}
