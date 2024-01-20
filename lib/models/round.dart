// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_tic_tac_toe/models/cell.dart';
import 'package:flutter_tic_tac_toe/models/score.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/json%20converters/online_cell_list_converter.dart';
import 'package:flutter_tic_tac_toe/utils/json%20converters/online_score_list_converter.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'round.g.dart';

@embedded
@JsonSerializable(explicitToJson: true)
class Round {
  /// Index references to a round in [Room.rounds].
  int index = 0;

  /// Index references to the current player in [Room.players].
  int currentPlayerIndex = 0;

  /// Index references to the winner in [Room.players].
  int? winnerIndex;

  /// Container that stores all the drawn [Cell] on the board in order.
  List<Cell?> turns = [];

  /// Scores of 2 players in this round.
  List<Score> scores = [Score(), Score()];

  // CONSTRUCTORS
  Round();

  Round.custom(
      {int? index,
      int? currentPlayerIndex,
      this.winnerIndex,
      List<Cell>? turns,
      List<Score>? scores})
      : index = index ?? 0,
        currentPlayerIndex = 0,
        turns = turns ?? [],
        scores = scores ?? [Score(), Score()];

  Round.all(
      this.index, this.currentPlayerIndex, this.winnerIndex, this.turns, this.scores); // getters

  // METHODS: CLONE
  Round cloneForNextRound() {
    logger.t('clone next round');
    return Round.custom(
      index: index + 1,
      scores: [getPlayer1Score().cloneForNextRound(), getPlayer2Score().cloneForNextRound()],
    );
  }

  // GETTERS
  int getRoundCount() {
    return index + 1;
  }

  int getTurnCount() {
    if (hasWinner()) {
      return turns.length; // There are no next turn.
    }
    return turns.length + 1;
  }

  Cell? getLastTurn() {
    return turns.last;
  }

  Score getPlayer1Score() {
    return scores[0];
  }

  Score getPlayer2Score() {
    return scores[1];
  }

  Score? getWinnerScore() {
    if (hasWinner()) {
      return scores[winnerIndex!];
    } else {
      return null;
    }
  }

  // METHODS: BOOLEAN
  bool hasWinner() {
    return winnerIndex != null;
  }

  bool isPlayer1Win() {
    return hasWinner() && winnerIndex == 0;
  }

  bool isPlayer2Win() {
    return hasWinner() && winnerIndex == 1;
  }

  bool isPlayer1Turn() {
    return currentPlayerIndex == 0;
  }

  bool isPlayer2Turn() {
    return currentPlayerIndex == 1;
  }

  // METHODS: BUSINESS
  /// Resets the round by clearing the winner, turns, and current player index.
  reset() {
    if (hasWinner()) {
      getWinnerScore()!.reset();
      winnerIndex = null;
    }
    turns = [];
    currentPlayerIndex = 0;
  }

  void togglePlayer() {
    if (currentPlayerIndex == 0) {
      currentPlayerIndex = 1;
    } else {
      currentPlayerIndex = 0;
    }
  }

  /// When draw Seed at a cell, automatically change to next turn.
  void GoToNextTurn() {
    togglePlayer();
    // turns = [...turns, cell];
    // logger.t('next turn, current player: ${currentPlayerIndex! + 1}');
  }

  // JSON SERIALIZATION
  factory Round.fromJson(Map<String, dynamic> json) => Round()
    ..index = json['index'] as int
    ..currentPlayerIndex = json['currentPlayerIndex'] as int
    ..winnerIndex = json['winnerIndex'] as int?
    ..turns = const CellListConverter().fromJson(List<Map<String, dynamic>>.from(json['turns']))
    ..scores = const ScoreListConverter().fromJson(List<Map<String, dynamic>>.from(json['scores']));

  Map<String, dynamic> toJson() => _$RoundToJson(this);

  // METHODS: LOG
  @override
  String toString() {
    return 'Round{index: $index, currentPlayerIndex: $currentPlayerIndex, winnerIndex: $winnerIndex, turns: $turns, scores: $scores}';
  }

  String toShortString() {
    return 'Round{index: $index, currentPlayerIndex: $currentPlayerIndex, winnerIndex: $winnerIndex, scores: $scores}';
  }

  void logInfo() {
    logger.t(this);
  }

  void logShortInfo() {
    logger.t(toShortString());
  }
}
