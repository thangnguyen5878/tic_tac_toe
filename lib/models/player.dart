import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

/// A player in the game.
@embedded
@JsonSerializable(explicitToJson: true)
class Player {
  /// The index of the player.
  int? index;

  /// The name of the player.
  String? name;

  /// The seed of the player.
  @Enumerated(EnumType.name)
  Seed? seed;

  // CONSTRUCTORS
  /// Creates a new player instance.
  Player({this.index, this.name, this.seed});

  // METHODS: CLONE
  /// Creates a clone of the player for the next round.
  Player.cloneNextRound(Player player) {
    index = player.index;
    name = player.name;
    seed = player.seed;
  }

  // JSON SERIALIZATION
  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerToJson(this);

  // METHODS: LOG
  /// Returns a string representation of the player.
  @override
  String toString() {
    return 'Player{index: $index, name: $name, seed: $seed}';
  }

  /// Logs information about the player.
  void logInfo() {
    logger.t(this);
  }
}
