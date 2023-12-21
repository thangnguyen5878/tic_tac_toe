import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
import 'package:flutter_tic_tac_toe/models/online/online_player.dart';
import 'package:json_annotation/json_annotation.dart';

part 'online_round.g.dart';

@JsonSerializable(explicitToJson: true)
class OnlineRound {
  int? index;
  List<OnlinePlayer>? players;
  int? currentPlayerIndex;
  int? currentTurnIndex;
  int? winnerIndex;
  int? winTurnIndex;

  // @NestedOnlineCellListConverter()
  List<OnlineCell?> turns = [];
  // @NestedOnlineCellListConverter()
  List<OnlineCell?> historyTurns = [];

  int? _historyPlayerIndex;
  int? historyTurnIndex;

  // @DocumentReferenceConverter()
  // DocumentReference<Map<String, dynamic>>? roundRef;

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
    print('clone next round');
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
    print('next turn, current player: ${currentPlayerIndex! + 1}');
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
    print('next turn, current player: ${_historyPlayerIndex! + 1}');
  }

  updateFinalScore() {
    players!.map((player) => player.finalScore = player.score);
  }

  factory OnlineRound.fromJson(Map<String, dynamic> json) => _$OnlineRoundFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineRoundToJson(this);

  @override
  String toString() {
    return 'OnlineRound{number: $index, players: $players, currentPlayerIndex: $currentPlayerIndex, _historyPlayerIndex: $_historyPlayerIndex, winnerIndex: $winnerIndex, turns: $turns, historyTurns: $historyTurns, currentTurnIndex: $currentTurnIndex, winTurnIndex: $winTurnIndex, historyTurnIndex: $historyTurnIndex}';
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'index': this.index,
  //     'players': this.players,
  //     'currentPlayerIndex': this.currentPlayerIndex,
  //     'currentTurnIndex': this.currentTurnIndex,
  //     'winnerIndex': this.winnerIndex,
  //     'winTurnIndex': this.winTurnIndex,
  //     'turns': this.turns,
  //     'historyTurns': this.historyTurns,
  //     'historyPlayerIndex': this._historyPlayerIndex,
  //     'historyTurnIndex': this.historyTurnIndex,
  //   };
  // }
  //
  // factory OnlineRound.fromJson(Map<String, dynamic> map) {
  //   return OnlineRound.all(
  //     index: map['index'] as int,
  //     players: map['players'] as List<OnlinePlayer>,
  //     currentPlayerIndex: map['currentPlayerIndex'] as int,
  //     currentTurnIndex: map['currentTurnIndex'] as int,
  //     winnerIndex: map['winnerIndex'] as int,
  //     winTurnIndex: map['winTurnIndex'] as int,
  //     turns: map['turns'] as List<OnlineCell>,
  //     historyTurns: map['historyTurns'] as List<OnlineCell>,
  //     historyPlayerIndex: map['_historyPlayerIndex'] as int,
  //     historyTurnIndex: map['historyTurnIndex'] as int,
  //   );
  // }
}
