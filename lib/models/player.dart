import 'package:json_annotation/json_annotation.dart';

import 'package:tic_tac_toe/utils/seed.dart';

part 'player.g.dart';

@JsonSerializable()
class Player {
  String name;
  Seed seed;
  int score;

// player constructor with default score is 0
  Player(this.name, this.seed) : score = 0;
  
  // player constructor with all parameters
  Player.all(
      {required this.name,
      required this.seed,
      required this.score});

  @override
  String toString() {
    return '''$name, Seed: $seed, Score: $score\n''';
  }

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);

  Player copyWith({
    String? name,
    Seed? seed,
    int? score,
  }) {
    return Player(
      name ?? this.name,
      seed ?? this.seed,
    )..score = score ?? this.score;
  }
}
