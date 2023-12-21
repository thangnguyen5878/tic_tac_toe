import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'online_player.g.dart';

@JsonSerializable(explicitToJson: true)
class OnlinePlayer {
  int? index;
  String? name;
  Seed? seed;
  int? score;
  int? initialScore;
  int? finalScore;

  // @DocumentReferenceConverter()
  // DocumentReference<Map<String, dynamic>>? playerRef;

  OnlinePlayer({this.index, this.name, this.seed, int? score}) : score = score ?? 0
  {
    initialScore = score;
  }


  OnlinePlayer.all({this.index, this.name, this.seed, this.score, this.initialScore,
      this.finalScore});

  OnlinePlayer.cloneNextRound(OnlinePlayer player) {
    index = player.index;
    name = player.name;
    seed = player.seed;
    score = player.score;
    initialScore = player.score;
    finalScore = null;
  }

  factory OnlinePlayer.fromJson(Map<String, dynamic> json) => _$OnlinePlayerFromJson(json);
  Map<String, dynamic> toJson() => _$OnlinePlayerToJson(this);

  @override
  String toString() {
    return 'OnlinePlayer{index: $index, name: $name, seed: $seed, score: $score, initialScore: $initialScore, finalScore: $finalScore}';
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'index': this.index,
  //     'name': this.name,
  //     'seed': this.seed.toString(),
  //     'score': this.score,
  //     'initialScore': this.initialScore,
  //     'finalScore': this.finalScore,
  //   };
  // }
  //
  // factory OnlinePlayer.fromJson(Map<String, dynamic> map) {
  //   return OnlinePlayer.all(
  //     index: map['index'] as int,
  //     name: map['name'] as String,
  //     seed: map['seed'] as Seed,
  //     score: map['score'] as int,
  //     initialScore: map['initialScore'] as int,
  //     finalScore: map['finalScore'] as int,
  //   );
  // }
}
