import 'package:flutter_tic_tac_toe/models/player.dart';
import 'package:json_annotation/json_annotation.dart';

class PlayerListConverter implements JsonConverter<List<Player?>, List<Map<String, dynamic>>> {
  const PlayerListConverter();

  @override
  List<Player?> fromJson(List<dynamic> json) {
    List<Player?> result = [];
    for (var element in json) {
      if (element == null) {
        result.add(null);
      } else {
        result.add(Player.fromJson(element));
      }
    }
    return result;
  }

  @override
  List<Map<String, dynamic>> toJson(List<Player?> object) {
    return object
        .map((player) => player?.toJson() ?? {})
        // .cast<Map<String, dynamic>>()
        .toList();
  }
}
