import 'package:flutter_tic_tac_toe/models/online/online_board.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'online_history.g.dart';

/// The data for history function.
@JsonSerializable(explicitToJson: true)
class OnlineHistory {
  /// Index that references to the current history round in [Room.rounds].
  int currentRoundIndex = 0;

  /// Index that references to the current history turn in [Round.turns].
  int currentTurnIndex = 0; // No seed on the board;

  /// Index that references to the current history player in [Room.players].
  int currentPlayerIndex = 0;

  /// Board contains all data shown in the board of [HistoryDetailsPage].
  OnlineBoard board = OnlineBoard();

  // CONSTRUCTORS
  OnlineHistory();

  OnlineHistory.all(
      this.currentTurnIndex, this.currentRoundIndex, this.currentPlayerIndex, this.board);

  OnlineHistory.custom(
      {int? currentRoundIndex, int? currentTurnIndex, int? currentPlayerIndex, OnlineBoard? board})
      : currentRoundIndex = currentRoundIndex ?? 0,
        currentTurnIndex = currentTurnIndex ?? 0,
        currentPlayerIndex = currentPlayerIndex ?? 0,
        board = board ?? OnlineBoard();

  // GETTERS
  int getTurnCount() {
    return currentTurnIndex + 1;
  }

  // METHODS: BOOLEAN
  bool isPlayer1Turn() {
    return currentPlayerIndex == 0;
  }

  bool isPlayer2Turn() {
    return currentPlayerIndex == 1;
  }

  bool isFirstTurn() {
    return currentTurnIndex == 0;
  }

  // METHODS: BUSINESS
  void reset() {
    currentPlayerIndex = 0;
    currentTurnIndex = 0;
  }

  void togglePlayer() {
    if (isPlayer1Turn()) {
      currentPlayerIndex = 1;
    } else {
      currentPlayerIndex = 0;
    }
  }

  void goToNextTurn() {
    togglePlayer();
    currentTurnIndex++;
  }

  void goToPreviousTurn() {
    togglePlayer();
    currentTurnIndex--;
  }

  // METHODS: LOG
  @override
  String toString() {
    return 'OnlineHistory{currentRoundIndex: $currentRoundIndex, currentTurnIndex: $currentTurnIndex, currentPlayerIndex: $currentPlayerIndex, board: $board}';
  }

  String toShortString() {
    return 'OnlineHistory{currentRoundIndex: $currentRoundIndex, currentTurnIndex: $currentTurnIndex, currentPlayerIndex: $currentPlayerIndex, board: ${board.toShortString()}';
  }

  void logInfo() {
    logger.t(this);
  }

  void logShortInfo() {
    logger.t(toShortString());
  }
}
