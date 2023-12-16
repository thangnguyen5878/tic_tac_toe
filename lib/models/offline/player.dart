import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:isar/isar.dart';

part 'player.g.dart';

@embedded
class Player {
  int? index;

  String? name;

  @Enumerated(EnumType.name)
  Seed? seed;

  int? score;

  int? initialScore;

  int? finalScore;

  Player({this.index, this.name, this.seed, int? score}) : score = score ?? 0
  {
    initialScore = score;
  }

  Player.cloneNextRound(Player player) {
    index = player.index;
    name = player.name;
    seed = player.seed;
    score = player.score;
    initialScore = player.score;
    finalScore = null;
  }

  @override
  String toString() {
    return 'Player{index: $index, name: $name, seed: $seed, score: $score, initialScore: $initialScore, finalScore: $finalScore}';
  }
}
