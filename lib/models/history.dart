import 'package:flutter_tic_tac_toe/models/board.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

/// The data for history function.
@embedded
@JsonSerializable(explicitToJson: true)
class History {
  /// Index that references to the current history round in [Room.rounds].
  int currentRoundIndex = 0;

  /// Index that references to the current history turn in [Round.turns].
  int currentTurnIndex = 0; // No seed on the board;

  /// Index that references to the current history player in [Room.players].
  int currentPlayerIndex = 0;

  /// Board contains all data shown in the board of [HistoryDetailsPage].
  Board board = Board();

  // CONSTRUCTORS
  History();

  History.all(this.currentTurnIndex, this.currentRoundIndex, this.currentPlayerIndex, this.board);

  History.custom(
      {int? currentRoundIndex, int? currentTurnIndex, int? currentPlayerIndex, Board? board})
      : currentRoundIndex = currentRoundIndex ?? 0,
        currentTurnIndex = currentTurnIndex ?? 0,
        currentPlayerIndex = currentPlayerIndex ?? 0,
        board = board ?? Board();

  // GETTERS: BOOLEAN
  /// Returns the number of turns in the history.
  int getTurnCount() {
    return currentTurnIndex + 1;
  }

  /// Returns whether the current player is player 1.
  bool isPlayer1Turn() {
    return currentPlayerIndex == 0;
  }

  /// Returns whether the current player is player 2.
  bool isPlayer2Turn() {
    return currentPlayerIndex == 1;
  }

  /// Returns whether it is the first turn in the history.
  bool isFirstTurn() {
    return currentTurnIndex == 0;
  }

  // METHODS: BOOLEAN
  /// Resets the history to its initial state.
  void reset() {
    currentPlayerIndex = 0;
    currentTurnIndex = 0;
  }

  /// Switches the current player.
  void togglePlayer() {
    if (isPlayer1Turn()) {
      currentPlayerIndex = 1;
    } else {
      currentPlayerIndex = 0;
    }
  }

  /// Moves to the next turn in the history.
  void goToNextTurn() {
    togglePlayer();
    currentTurnIndex++;
  }

  /// Moves to the previous turn in the history.
  void goToPreviousTurn() {
    togglePlayer();
    currentTurnIndex--;
  }

  // JSON SERIALIZATION
  factory History.fromJson(Map<String, dynamic> json) => _$HistoryFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryToJson(this);

  // METHODS: LOG
  @override
  String toString() {
    return 'History{currentRoundIndex: $currentRoundIndex, currentTurnIndex: $currentTurnIndex, currentPlayerIndex: $currentPlayerIndex, board: $board}';
  }

  /// Returns a shortened version of the history as a string.
  String toShortString() {
    return 'History{currentRoundIndex: $currentRoundIndex, currentTurnIndex: $currentTurnIndex, currentPlayerIndex: $currentPlayerIndex, board: ${board.toShortString()}';
  }

  /// Logs information about the history.
  void logInfo() {
    logger.t(this);
  }

  /// Logs a shortened version of the history information.
  void logShortInfo() {
    logger.t(toShortString());
  }
}
