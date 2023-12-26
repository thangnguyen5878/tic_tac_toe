// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/models/offline/cell.dart';
import 'package:flutter_tic_tac_toe/models/offline/player.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:isar/isar.dart';


part 'round.g.dart';

@embedded
class Round {
  int? index;

  List<Player>? players;

  int? currentPlayerIndex;

  int? currentTurnIndex;

  int? winnerIndex;

  int? winTurnIndex;

  List<Cell?> turns = [];

  List<Cell?> historyTurns = [];

  int? _historyPlayerIndex;

  int? historyTurnIndex;

  Round({this.index, this.winnerIndex, this.players})
      : currentTurnIndex = 0,
        historyTurnIndex = 0,
        currentPlayerIndex = 0,
        _historyPlayerIndex = 0;

  // getters
  // round
  int getRoundCount() {
    return index! + 1;
  }

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

  Round.cloneNextRound(Round round) {
    index = round.index! + 1;
    players = round.players!.map((player) => Player.cloneNextRound(player)).toList();
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
    // if (historyCurrentTurnIndex! >= winTurnIndex! - 1) {
    //   historyCurrentPlayerIndex = winnerIndex;
    //   historyCurrentTurnIndex = winTurnIndex;
    // }
    // logger.t('next turn, current player: ${historyCurrentPlayerIndex! + 1}');
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
    logger.t('next turn, current player: ${_historyPlayerIndex! + 1}');
  }

  updateFinalScore() {
    players!.map((player) => player.finalScore = player.score);
  }

  @override
  String toString() {
    return 'Round{number: $index, players: $players, currentPlayerIndex: $currentPlayerIndex, _historyPlayerIndex: $_historyPlayerIndex, winnerIndex: $winnerIndex, turns: $turns, historyTurns: $historyTurns, currentTurnIndex: $currentTurnIndex, winTurnIndex: $winTurnIndex, historyTurnIndex: $historyTurnIndex}';
  }
}
