import 'package:flutter_tic_tac_toe/models/offline/board.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:isar/isar.dart';

part 'history.g.dart';

/// The data for history function.
@embedded
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
    return 'History{currentRoundIndex: $currentRoundIndex, currentTurnIndex: $currentTurnIndex, currentPlayerIndex: $currentPlayerIndex, board: $board}';
  }

  String toShortString() {
    return 'History{currentRoundIndex: $currentRoundIndex, currentTurnIndex: $currentTurnIndex, currentPlayerIndex: $currentPlayerIndex, board: ${board.toShortString()}';
  }

  void logInfo() {
    logger.t(this);
  }

  void logShortInfo() {
    logger.t(toShortString());
  }
}
