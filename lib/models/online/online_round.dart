import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
import 'package:flutter_tic_tac_toe/models/online/online_player.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/json%20converters/online_cell_list_converter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/json converters/online_player_list_converter.dart';

part 'online_round.g.dart';

@JsonSerializable(explicitToJson: true)
class OnlineRound {
  int? index;

  @OnlinePlayerListConverter()
  List<OnlinePlayer>? players;

  int? currentPlayerIndex;
  int? currentTurnIndex;
  int? winnerIndex;
  int? winTurnIndex;

  @OnlineCellListConverter()
  List<OnlineCell?> turns = [];

  @OnlineCellListConverter()
  List<OnlineCell?> historyTurns = [];

  @JsonKey(includeFromJson: true, includeToJson: true)
  int? _historyPlayerIndex;
  int? historyTurnIndex;

  OnlineRound({this.index, this.winnerIndex, this.players})
      : currentTurnIndex = 0,
        historyTurnIndex = 0,
        currentPlayerIndex = 0,
        _historyPlayerIndex = 0;


  OnlineRound.all({
      this.index,
      this.players,
      this.currentPlayerIndex,
      this.currentTurnIndex,
      this.winnerIndex,
      this.winTurnIndex,
      required this.turns,
      required this.historyTurns,
      required int historyPlayerIndex,
      this.historyTurnIndex}) {
    _historyPlayerIndex = historyPlayerIndex;
  }

  // getters
  // round
  int getRoundCount() {
    return index! + 1;
  }

  // players
  OnlinePlayer getPlayer1() {
    return players![0];
  }

  OnlinePlayer getPlayer2() {
    return players![1];
  }

  OnlinePlayer getCurrentPlayer() {
    return players![currentPlayerIndex!];
  }

  // turns
  int getTurnCount() {
    return currentTurnIndex! + 1;
  }

  // getters history
  OnlinePlayer getWinner() {
    return players![winnerIndex!];
  }

  OnlinePlayer getCurrentHistoryPlayer() {
    return players![_historyPlayerIndex!];
  }

  int getHistoryPlayerIndex() {
    return isHistoryWinTurn() ? winnerIndex! : _historyPlayerIndex!;
  }

  int getHistoryPlayer1Score() {
    return isHistoryWinTurn() ? getPlayer1().finalScore! : getPlayer1().initialScore!;
  }

  int getHistoryPlayer2Score() {
    return isHistoryWinTurn() ? getPlayer2().finalScore! : getPlayer2().initialScore!;
  }

  OnlineCell getCurrentTurn() {
    return turns[currentTurnIndex!]!;
  }

  OnlineCell getHistoryTurn() {
    return turns[historyTurnIndex!]!;
  }

  int getHistoryTurnCount() {
    return isHistoryWinTurn() ? winTurnIndex! + 1 : historyTurnIndex! + 1;
  }

  // check
  bool isHistoryWinTurn() {
    return winTurnIndex != null && historyTurnIndex == winTurnIndex! + 1;
  }

  bool hasWinner() {
    return winnerIndex != null;
  }

  bool isPlayer1Win() {
    return hasWinner() && winnerIndex == 0;
  }

  bool isPlayer2Win() {
    return hasWinner() && winnerIndex == 1;
  }

  OnlineRound.cloneNextRound(OnlineRound round) {
    index = round.index! + 1;
    players = round.players!.map((player) => OnlinePlayer.cloneNextRound(player)).toList();
    currentPlayerIndex = 0;
    _historyPlayerIndex = 0;
    winnerIndex = null;
    turns = [];
    historyTurns = [];
    currentTurnIndex = 0;
    historyTurnIndex = 0;
    winTurnIndex = null;
    logger.t('clone next round');
  }

  reset() {
    // if there's a winner
    if (winnerIndex != null) {
      getWinner().score = getWinner().score! - 1;
    }
    winnerIndex = null;
    turns = [];
    currentTurnIndex = 0;
  }

  resetHistory() {
    _historyPlayerIndex = 0;
    historyTurnIndex = 0;
    historyTurns = [];
  }

  /// When draw Seed at a cell, automatically change to next turn.
  nextTurn() {
    if (currentPlayerIndex == 0) {
      currentPlayerIndex = 1;
    } else {
      currentPlayerIndex = 0;
    }
    currentTurnIndex = currentTurnIndex! + 1;
    logger.t('next turn, current player: ${currentPlayerIndex! + 1}');
  }

  historyNextTurn() {
    if (_historyPlayerIndex == 0) {
      _historyPlayerIndex = 1;
    } else {
      _historyPlayerIndex = 0;
    }
    historyTurnIndex = historyTurnIndex! + 1;
  }

  historyPreviousTurn() {
    if (_historyPlayerIndex == 0) {
      _historyPlayerIndex = 1;
    } else {
      _historyPlayerIndex = 0;
    }
    historyTurnIndex = historyTurnIndex! - 1;
    logger.t('next turn, current player: ${_historyPlayerIndex! + 1}');
  }

  updateFinalScore() {
    players!.map((player) => player.finalScore = player.score);
  }

  factory OnlineRound.fromJson(Map<String, dynamic> json) => OnlineRound(
    index: json['index'] as int?,
    winnerIndex: json['winnerIndex'] as int?,
    players: (json['players'] as List<dynamic>?)
        ?.map((e) => OnlinePlayer.fromJson(e))
        .toList(),
  )
    ..currentPlayerIndex = json['currentPlayerIndex'] as int?
    ..currentTurnIndex = json['currentTurnIndex'] as int?
    ..winTurnIndex = json['winTurnIndex'] as int?
    ..turns = const OnlineCellListConverter()
        .fromJson(json['turns'])
    ..historyTurns = const OnlineCellListConverter()
        .fromJson(json['historyTurns'])
    .._historyPlayerIndex = json['_historyPlayerIndex'] as int?
    ..historyTurnIndex = json['historyTurnIndex'] as int?;
  // factory OnlineRound.fromJson(Map<String, dynamic> json) => _$OnlineRoundFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineRoundToJson(this);

  @override
  String toString() {
    return 'OnlineRound{index: $index, players: $players, currentPlayerIndex: $currentPlayerIndex, currentTurnIndex: $currentTurnIndex, winnerIndex: $winnerIndex, winTurnIndex: $winTurnIndex, turns: $turns, historyTurns: $historyTurns, _historyPlayerIndex: $_historyPlayerIndex, historyTurnIndex: $historyTurnIndex}';
  }

}
