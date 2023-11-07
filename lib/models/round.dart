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

  int? currentHistoryPlayerIndex;

  int? winnerIndex;

  List<Cell?> turns = [];

  List<Cell?> historyTurns = [];

  int? currentTurnIndex;

  int? winTurnIndex;

  int? currentHistoryTurnIndex;

  Round({this.number, this.winnerIndex, this.players})
      : currentTurnIndex = 0,
        currentHistoryTurnIndex = 0,
        currentPlayerIndex = 0,
        currentHistoryPlayerIndex = 0;

  Player getCurrentPLayer() {
    return players![currentPlayerIndex!];
  }

  Player getCurrentHistoryPlayer() {
    return players![currentHistoryPlayerIndex!];
  }

  Player getWinner() {
    return players![winnerIndex!];
  }

  Cell getCurrentTurn() {
    return turns[currentTurnIndex!]!;
  }

  Cell getWinTurn() {
    return turns[winTurnIndex!]!;
  }

  Cell getCurrentHistoryTurn() {
    return turns[currentHistoryTurnIndex!]!;
  }

  Round.cloneNextRound(Round round) {
    number = round.number! + 1;
    players = round.players!.map((player) => Player.clone(player)).toList();
    currentPlayerIndex = 0;
    currentHistoryPlayerIndex = 0;
    winnerIndex = null;
    turns = [];
    historyTurns = [];
    currentTurnIndex = 0;
    currentHistoryTurnIndex = 0;
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
  /// - Change the player when the board move to next turn (player 1 -> player 2, player 2 -> player 1)
  /// - Increment turnCount
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
    if (currentHistoryPlayerIndex == 0) {
      currentHistoryPlayerIndex = 1;
    } else {
      currentHistoryPlayerIndex = 0;
    }
    currentHistoryTurnIndex = currentHistoryTurnIndex! + 1;
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
    if (currentHistoryPlayerIndex == 0) {
      currentHistoryPlayerIndex = 1;
    } else {
      currentHistoryPlayerIndex = 0;
    }
    currentHistoryTurnIndex = currentHistoryTurnIndex! - 1;
    print('next turn, current player: ${currentHistoryPlayerIndex! + 1}');
  }

  updateFinalScore() {
    players!.map((player) => player.finalScore = player.score);
  }

  @override
  String toString() {
    return 'Round{number: $number, players: $players, currentPlayerIndex: $currentPlayerIndex, winnerIndex: $winnerIndex, turns: $turns, currentTurnIndex: $currentTurnIndex, historyCurrentTurnIndex: $currentHistoryTurnIndex}';
  }
}
