// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:isar/isar.dart';

import 'package:flutter_tic_tac_toe/models/cell.dart';
import 'package:flutter_tic_tac_toe/models/player.dart';

part 'round.g.dart';

@embedded
class Round {
  int? number;

  int? turnCount;

  int? winnerIndex;

  List<int> scores = [0, 0];

  List<Cell?> turns = [];

  Round({this.number, int? turnCount, this.winnerIndex})
      : this.turnCount = turnCount ?? 1;

  reset() {
    if (winnerIndex == 0) {
      scores[0]--;
    }
    if (winnerIndex == 1) {
      scores[1]--;
    }
    winnerIndex = null;
    turnCount = 0;
    turns = [];
  }

  @override
  String toString() {
    return 'Round(number: $number, turnCount: $turnCount, winnerId: $winnerIndex, scores: $scores, turns: $turns)';
  }
}
