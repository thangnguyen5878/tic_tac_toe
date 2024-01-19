// import 'package:flutter_tic_tac_toe/models/offline/board.dart';
// import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// part 'online_history.g.dart';
//
// /// The data for history function.
// @JsonSerializable(explicitToJson: true)
// class History {
//   /// Index that references to the current history round in [Room.rounds].
//   int currentRoundIndex = 0;
//
//   /// Index that references to the current history turn in [Round.turns].
//   int currentTurnIndex = 0; // No seed on the board;
//
//   /// Index that references to the current history player in [Room.players].
//   int currentPlayerIndex = 0;
//
//   /// Board contains all data shown in the board of [HistoryDetailsPage].
//   Board board = Board();
//
//   // CONSTRUCTORS
//   /// Creates a new instance of the [History] class.
//   History();
//
//   /// Creates a new instance of the [History] class with the specified values.
//   History.all(this.currentTurnIndex, this.currentRoundIndex, this.currentPlayerIndex, this.board);
//
//   /// Creates a new instance of the [History] class with the specified properties.
//   History.custom(
//       {int? currentRoundIndex, int? currentTurnIndex, int? currentPlayerIndex, Board? board})
//       : currentRoundIndex = currentRoundIndex ?? 0,
//         currentTurnIndex = currentTurnIndex ?? 0,
//         currentPlayerIndex = currentPlayerIndex ?? 0,
//         board = board ?? Board();
//
//   // GETTERS
//   int getTurnCount() {
//     return currentTurnIndex + 1;
//   }
//
//   // METHODS: BOOLEAN
//   /// Returns whether the current player is player 1.
//   bool isPlayer1Turn() {
//     return currentPlayerIndex == 0;
//   }
//
//   /// Returns whether the current player is player 2.
//   bool isPlayer2Turn() {
//     return currentPlayerIndex == 1;
//   }
//
//   /// Returns whether it is the first turn in the history.
//   bool isFirstTurn() {
//     return currentTurnIndex == 0;
//   }
//
//   // METHODS: BUSINESS
//   /// Resets the history to its initial state.
//   void reset() {
//     currentPlayerIndex = 0;
//     currentTurnIndex = 0;
//   }
//
//   /// Switches the current player.
//   void togglePlayer() {
//     if (isPlayer1Turn()) {
//       currentPlayerIndex = 1;
//     } else {
//       currentPlayerIndex = 0;
//     }
//   }
//
//   /// Moves to the next turn in the history.
//   void goToNextTurn() {
//     togglePlayer();
//     currentTurnIndex++;
//   }
//
//   /// Moves to the previous turn in the history.
//   void goToPreviousTurn() {
//     togglePlayer();
//     currentTurnIndex--;
//   }
//
//   // JSON SERIALIZATION
//   factory History.fromJson(Map<String, dynamic> json) => _$OnlineHistoryFromJson(json);
//   Map<String, dynamic> toJson() => _$OnlineHistoryToJson(this);
//
//   // METHODS: LOG
//   @override
//   String toString() {
//     return 'OnlineHistory{currentRoundIndex: $currentRoundIndex, currentTurnIndex: $currentTurnIndex, currentPlayerIndex: $currentPlayerIndex, board: $board}';
//   }
//
//   /// Returns a shortened version of the history as a string.
//   String toShortString() {
//     return 'OnlineHistory{currentRoundIndex: $currentRoundIndex, currentTurnIndex: $currentTurnIndex, currentPlayerIndex: $currentPlayerIndex, board: ${board.toShortString()}';
//   }
//
//   /// Logs information about the history.
//   void logInfo() {
//     logger.t(this);
//   }
//
//   /// Logs a shortened version of the history information.
//   void logShortInfo() {
//     logger.t(toShortString());
//   }
// }
