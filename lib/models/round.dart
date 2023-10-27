// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_tic_tac_toe/models/board.dart';
import 'package:isar/isar.dart';

import 'package:flutter_tic_tac_toe/models/cell.dart';
import 'package:flutter_tic_tac_toe/models/player.dart';

part 'round.g.dart';

@embedded
class Round {
  int? number;

  List<Player>? players;
  
  int? currentPlayerIndex;

  int? winnerIndex;
  
  List<Cell?> turns = [];

  int? currentTurnIndex;

  int? historyCurrentTurnIndex;

  Round({this.number, int? turnCount, this.winnerIndex, this.players})
      : currentTurnIndex = 0,
        historyCurrentTurnIndex = 0,
        currentPlayerIndex = 0;

  reset() {
    // if there's a winner
    if (winnerIndex != null) {
      players![winnerIndex!].score = players![winnerIndex!].score! - 1;
    }
    winnerIndex = null;
    turns = [];
    currentTurnIndex = 0;
  }

  /// When draw Seed at a cell, automatically change to next turn.
  /// - Change the player when the board move to next turn (player 1 -> player 2, player 2 -> player 1)
  /// - Increment turnCount
  void nextTurn() {
    if (currentPlayerIndex == 0) {
      currentPlayerIndex = 1;
    } else {
      currentPlayerIndex = 0;
    }
    currentTurnIndex = currentTurnIndex! + 1;
    print('next turn, current player: ${currentPlayerIndex! + 1}');
  }

  @override
  String toString() {
    return 'Round{number: $number, players: $players, currentPlayerIndex: $currentPlayerIndex, winnerIndex: $winnerIndex, turns: $turns, currentTurnIndex: $currentTurnIndex, historyCurrentTurnIndex: $historyCurrentTurnIndex}';
  }
}
