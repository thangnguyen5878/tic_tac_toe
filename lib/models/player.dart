import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:isar/isar.dart';

part 'player.g.dart';

@embedded
class Player {
  String? name;

  @Enumerated(EnumType.name)
  Seed? seed;

  int? score;

  Player({this.name, this.seed, int? score}) : score = score ?? 0;

  Player.clonePlayer(Player player) {
    this.name = player.name;
    this.seed = player.seed;
    this.score = player.score;
  }

  @override
  String toString() => 'Player(name: $name, seed: $seed, score: $score)';
}
