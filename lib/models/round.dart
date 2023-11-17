// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

import 'package:flutter_tic_tac_toe/models/cell.dart';
import 'package:flutter_tic_tac_toe/models/player.dart';

part 'round.g.dart';

@embedded
class Round {
  int? number;

  List<Player>? players;

  int? currentPlayerIndex;

  int? _historyPlayerIndex;

  int? winnerIndex;

  List<Cell?> turns = [];

  List<Cell?> historyTurns = [];

  int? currentTurnIndex;

  int? winTurnIndex;

  int? historyTurnIndex;

  Round({this.number, this.winnerIndex, this.players})
      : currentTurnIndex = 0,
        historyTurnIndex = 0,
        currentPlayerIndex = 0,
        _historyPlayerIndex = 0;

  // getters
  // players
  Player getPlayer1() {
    return players![0];
  }

  Player getPlayer2() {
    return players![1];
  }

  Player getCurrentPlayer() {
    return players![currentPlayerIndex!];
  }

  // turns
  int getTurnCount() {
    return currentTurnIndex! + 1;
  }

  // getters history
  Player getWinner() {
    return players![winnerIndex!];
  }

  Player getCurrentHistoryPlayer() {
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

  Cell getCurrentTurn() {
    return turns[currentTurnIndex!]!;
  }

  Cell getHistoryTurn() {
    return turns[historyTurnIndex!]!;
  }

  int getHistoryTurnCount() {
    return isHistoryWinTurn() ? winTurnIndex! + 1 : historyTurnIndex! + 1;
  }

  bool isHistoryWinTurn() {
    return winTurnIndex != null && historyTurnIndex == winTurnIndex! + 1;
  }

  Round.cloneNextRound(Round round) {
    number = round.number! + 1;
    players = round.players!.map((player) => Player.cloneNextRound(player)).toList();
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
    // if (historyCurrentTurnIndex! >= winTurnIndex! - 1) {
    //   historyCurrentPlayerIndex = winnerIndex;
    //   historyCurrentTurnIndex = winTurnIndex;
    // }
    // print('next turn, current player: ${historyCurrentPlayerIndex! + 1}');
  }

  historyPreviousTurn() {
    // if (historyCurrentTurnIndex == 1) {
    //   historyCurrentPlayerIndex = null;
    // }
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

  @override
  String toString() {
    return 'Round{number: $number, players: $players, currentPlayerIndex: $currentPlayerIndex, _historyPlayerIndex: $_historyPlayerIndex, winnerIndex: $winnerIndex, turns: $turns, historyTurns: $historyTurns, currentTurnIndex: $currentTurnIndex, winTurnIndex: $winTurnIndex, historyTurnIndex: $historyTurnIndex}';
  }
}
