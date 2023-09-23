import 'package:tic_tac_toe/models/player.dart';
import 'package:json_annotation/json_annotation.dart';

part 'round.g.dart';

@JsonSerializable(explicitToJson: true)
class Round {
  int number;
  int turnCount;
  Player? winner;

// round constructor with default values
  Round(int number)
      : number = 0,
        turnCount = 0;

// round constructor with all parameters
  Round.all({required this.number, required this.turnCount, required this.winner});

  factory Round.fromJson(Map<String, dynamic> json) => _$RoundFromJson(json);
  Map<String, dynamic> toJson() => _$RoundToJson(this);

  Round copyWith({
    int? number,
    int? turnCount,
    Player? winner,
  }) {
    return Round(number ?? this.number)
      ..turnCount = turnCount ?? this.turnCount
      ..winner = winner ?? this.winner;
  }

  @override
  String toString() {
    return 'Round $number, turnCount: $turnCount, winner: $winner\n';
  }
}
