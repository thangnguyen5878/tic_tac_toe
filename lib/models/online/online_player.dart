import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'online_player.g.dart';

/// A player in the game.
@JsonSerializable(explicitToJson: true)
class OnlinePlayer {
  /// The index of the player.
  int? index;

  /// The name of the player.
  String? name;

  /// The seed of the player.
  Seed? seed;

  // CONSTRUCTORS
  /// Creates a new player instance.
  OnlinePlayer({this.index, this.name, this.seed});

  // METHODS: CLONE
  /// Creates a clone of the player for the next round.
  OnlinePlayer.cloneNextRound(OnlinePlayer player) {
    index = player.index;
    name = player.name;
    seed = player.seed;
  }

  // JSON SERIALIZATION
  factory OnlinePlayer.fromJson(Map<String, dynamic> json) => _$OnlinePlayerFromJson(json);
  Map<String, dynamic> toJson() => _$OnlinePlayerToJson(this);

  // METHODS: LOG
  /// Returns a string representation of the player.
  @override
  String toString() {
    return 'OnlinePlayer{index: $index, name: $name, seed: $seed}';
  }

  /// Logs information about the player.
  void logInfo() {
    logger.t(this);
  }
}
