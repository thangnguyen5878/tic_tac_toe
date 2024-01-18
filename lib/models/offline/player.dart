import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:isar/isar.dart';

part 'player.g.dart';

@embedded
class Player {
  int? index;

  String? name;

  @Enumerated(EnumType.name)
  Seed? seed;

  // CONSTRUCTORS
  Player({this.index, this.name, this.seed});

  // METHODS: CLONE
  Player.cloneNextRound(Player player) {
    index = player.index;
    name = player.name;
    seed = player.seed;
  }

  // METHOD: LOG
  @override
  String toString() {
    return 'Player{index: $index, name: $name, seed: $seed}';
  }

  void logInfo() {
    logger.t(this);
  }
}
