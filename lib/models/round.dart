// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:isar/isar.dart';

import 'package:flutter_tic_tac_toe/models/cell.dart';
import 'package:flutter_tic_tac_toe/models/player.dart';

part 'round.g.dart';

@embedded
class Round {
  int? number;

  int? turnCount;

  int? historyCurrentTurnIndex;

  int? winnerIndex;

  Player? currentPlayer;

  List<Player>? players;

  List<Cell?> turns = [];

  Round({this.number, int? turnCount, this.winnerIndex, this.players})
      : this.turnCount = turnCount ?? 1,
        this.currentPlayer = players![0],
        this.historyCurrentTurnIndex = 0;

  reset() {
    // if there's a winner
    if (winnerIndex != null) {
      players![winnerIndex!].score = players![winnerIndex!].score! - 1;
    }
    winnerIndex = null;
    turnCount = 1;
    turns = [];
  }

  /// When draw Seed at a cell, automatically change to next turn.
  /// - Change the player when the board move to next turn (player 1 -> player 2, player 2 -> player 1)
  /// - Increment turnCount
  void nextTurn() {
    if (currentPlayer!.seed == Seed.cross) {
      currentPlayer = players![1];
      turnCount = turnCount! + 1;
    } else {
      currentPlayer = players![0];
      turnCount = turnCount! + 1;
    }
    print('next turn, currentplayer: ${currentPlayer!.name}');
  }

  @override
  String toString() {
    return 'Round(number: $number, turnCount: $turnCount, winnerId: $winnerIndex, players: $players)';
  }
}
