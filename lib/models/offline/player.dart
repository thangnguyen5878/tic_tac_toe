import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:isar/isar.dart';

part 'player.g.dart';

@embedded
class Player {
  int? index;

  String? name;

  @Enumerated(EnumType.name)
  Seed? seed;

  Player({this.index, this.name, this.seed});

  Player.cloneNextRound(Player player) {
    index = player.index;
    name = player.name;
    seed = player.seed;
  }

  @override
  String toString() {
    return 'Player{index: $index, name: $name, seed: $seed}';
  }
}
