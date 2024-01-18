import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
import 'package:flutter_tic_tac_toe/models/online/online_score.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/json%20converters/online_cell_list_converter.dart';
import 'package:flutter_tic_tac_toe/utils/json%20converters/online_score_list_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'online_round.g.dart';

@JsonSerializable(explicitToJson: true)
class OnlineRound {
  /// Index references to a round in [Room.rounds].
  int index = 0;

  /// Index references to the current player in [Room.players].
  int currentPlayerIndex = 0;

  /// Index references to the winner in [Room.players].
  int? winnerIndex;

  /// Container that stores all the drawn [OnlineCell] on the board in order.
  @OnlineCellListConverter()
  List<OnlineCell?> turns = [];

  /// Scores of 2 players in this round.
  @OnlineScoreListConverter()
  List<OnlineScore> scores = [OnlineScore(), OnlineScore()];

  // CONSTRUCTORS
  OnlineRound();

  OnlineRound.custom(
      {int? index,
      int? currentPlayerIndex,
      this.winnerIndex,
      List<OnlineCell>? turns,
      List<OnlineScore>? scores})
      : index = index ?? 0,
        currentPlayerIndex = 0,
        turns = turns ?? [],
        scores = scores ?? [OnlineScore(), OnlineScore()];

  OnlineRound.all(
      this.index, this.currentPlayerIndex, this.winnerIndex, this.turns, this.scores); // getters

  // METHODS: CLONE
  OnlineRound cloneForNextRound() {
    logger.t('clone next round');
    return OnlineRound.custom(
      index: index + 1,
      scores: [getPlayer1Score().cloneForNextRound(), getPlayer2Score().cloneForNextRound()],
    );
  }

// GETTERS
  int getRoundCount() {
    return index! + 1;
  }

  int getTurnCount() {
    if (hasWinner()) {
      return turns.length; // There are no next turn.
    }
    return turns.length + 1;
  }

  OnlineCell? getLastTurn() {
    return turns.last;
  }

  OnlineScore getPlayer1Score() {
    return scores[0];
  }

  OnlineScore getPlayer2Score() {
    return scores[1];
  }

  OnlineScore? getWinnerScore() {
    if (hasWinner()) {
      return scores[winnerIndex!];
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
  // factory OnlineRound.fromJson(Map<String, dynamic> json) => OnlineRound(
  //       index: json['index'] as int?,
  //       winnerIndex: json['winnerIndex'] as int?,
  //       players: (json['players'] as List<dynamic>?)?.map((e) => OnlinePlayer.fromJson(e)).toList(),
  //     )
  //       ..currentPlayerIndex = json['currentPlayerIndex'] as int?
  //       ..currentTurnIndex = json['currentTurnIndex'] as int?
  //       ..winTurnIndex = json['winTurnIndex'] as int?
  //       ..turns = const OnlineCellListConverter().fromJson(json['turns'])
  //       ..historyTurns = const OnlineCellListConverter().fromJson(json['historyTurns'])
  //       .._historyPlayerIndex = json['_historyPlayerIndex'] as int?
  //       ..historyTurnIndex = json['historyTurnIndex'] as int?;
  factory OnlineRound.fromJson(Map<String, dynamic> json) => _$OnlineRoundFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineRoundToJson(this);

  // METHODS: LOG
  @override
  String toString() {
    return 'OnlineRound{index: $index, currentPlayerIndex: $currentPlayerIndex, winnerIndex: $winnerIndex, turns: $turns, scores: $scores}';
  }

  String toShortString() {
    return 'OnlineRound{index: $index, currentPlayerIndex: $currentPlayerIndex, winnerIndex: $winnerIndex, scores: $scores}';
  }

  void logInfo() {
    logger.t(this);
  }

  void logShortInfo() {
    logger.t(toShortString());
  }
}
