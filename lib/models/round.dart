// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
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

  int? _historyTurnIndex;

  Round({this.number, this.winnerIndex})
      : players = [
          Player(index: 0, name: 'Player 1', seed: Seed.cross, score: 0),
          Player(index: 1, name: 'Player 2', seed: Seed.nought, score: 0)
        ],
        currentTurnIndex = 0,
        _historyTurnIndex = 0,
        currentPlayerIndex = 0,
        _historyPlayerIndex = 0;

  Round.cloneNextRound(Round round) {
    number = round.number! + 1;
    players = round.players!.map((player) => Player.cloneNextRound(player)).toList();
    currentPlayerIndex = 0;
    _historyPlayerIndex = 0;
    winnerIndex = null;
    turns = [];
    historyTurns = [];
    currentTurnIndex = 0;
    _historyTurnIndex = 0;
    winTurnIndex = null;
  }

  // getter
  // players
  Player get currentPLayer {
    return players![currentPlayerIndex!];
  }

  Player get player1 {
    return players![0];
  }

  Player get player2 {
    return players![1];
  }

  Player get winner {
    return players![winnerIndex!];
  }

  // turns
  Cell get currentTurn {
    return turns[currentTurnIndex!]!;
  }

  Cell get winTurn {
    return turns[winTurnIndex!]!;
  }

  int get turnCount {
    return currentTurnIndex! + 1;
  }

  // getter history
  // history players
  int get historyPlayerIndex {
    return isHistoryWinTurn ? winnerIndex! : _historyPlayerIndex!;
  }

  Player get historyPlayer {
    return players![historyPlayerIndex];
  }

  int get historyPlayer1Score {
    return isHistoryWinTurn ? player1.finalScore! : player1.initialScore!;
  }

  int get historyPlayer2Score {
    return isHistoryWinTurn ? player2.finalScore! : player2.initialScore!;
  }
  // history turns
  int get historyTurnIndex {
    return _historyTurnIndex!;
  }

  int get historyTurnCount {
    return isHistoryWinTurn ? winTurnIndex! + 1 : historyTurnIndex + 1;
  }

  bool get isHistoryWinTurn {
    return winTurnIndex != null && historyTurnIndex == winTurnIndex! + 1;
  }

  Cell get historyTurn {
    return turns[historyTurnIndex]!;
  }

  reset() {
    // if there's a winner
    if (winnerIndex != null) {
      winner.score = winner.score! - 1;
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
    if (historyPlayerIndex == 0) {
      _historyPlayerIndex = 1;
    } else {
      _historyPlayerIndex = 0;
    }
    _historyTurnIndex = _historyTurnIndex! + 1;
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
    _historyTurnIndex = _historyTurnIndex! - 1;
    print('next turn, current player: ${_historyPlayerIndex! + 1}');
  }

  updateFinalScore() {
    players!.map((player) => player.finalScore = player.score);
  }

  @override
  String toString() {
    return 'Round{number: $number, players: $players, currentPlayerIndex: $currentPlayerIndex, _historyPlayerIndex: $_historyPlayerIndex, winnerIndex: $winnerIndex, turns: $turns, historyTurns: $historyTurns, currentTurnIndex: $currentTurnIndex, winTurnIndex: $winTurnIndex, _historyTurnIndex: $_historyTurnIndex}';
  }
}
