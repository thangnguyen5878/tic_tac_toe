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

  int? historyPlayerIndex;

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
        historyPlayerIndex = 0;

  // getters
  Player getPLayer1() {
    return players![0];
  }

  Player getPLayer2() {
    return players![1];
  }

  Player getCurrentPLayer() {
    return players![currentPlayerIndex!];
  }

  // getters history
  Player getWinner() {
    return players![winnerIndex!];
  }

  Player getCurrentHistoryPlayer() {
    return players![historyPlayerIndex!];
  }

  Cell getCurrentTurn() {
    return turns[currentTurnIndex!]!;
  }

  Cell getCurrentHistoryTurn() {
    return turns[historyTurnIndex!]!;
  }

  int getHistoryTurnCount() {
    return isHistoryWinTurn() ? historyTurnIndex! + 1 : winTurnIndex! + 1;
  }

  bool isHistoryWinTurn() {
    return winTurnIndex != null && historyTurnIndex == winTurnIndex! + 1;
  }

  Round.cloneNextRound(Round round) {
    number = round.number! + 1;
    players = round.players!.map((player) => Player.clone(player)).toList();
    currentPlayerIndex = 0;
    historyPlayerIndex = 0;
    winnerIndex = null;
    turns = [];
    historyTurns = [];
    currentTurnIndex = 0;
    historyTurnIndex = 0;
    winTurnIndex = -1;
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
    if (historyPlayerIndex == 0) {
      historyPlayerIndex = 1;
    } else {
      historyPlayerIndex = 0;
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
    if (historyPlayerIndex == 0) {
      historyPlayerIndex = 1;
    } else {
      historyPlayerIndex = 0;
    }
    historyTurnIndex = historyTurnIndex! - 1;
    print('next turn, current player: ${historyPlayerIndex! + 1}');
  }

  updateFinalScore() {
    players!.map((player) => player.finalScore = player.score);
  }

  @override
  String toString() {
    return 'Round{number: $number, players: $players, currentPlayerIndex: $currentPlayerIndex, winnerIndex: $winnerIndex, turns: $turns, currentTurnIndex: $currentTurnIndex, historyCurrentTurnIndex: $historyTurnIndex}';
  }
}
