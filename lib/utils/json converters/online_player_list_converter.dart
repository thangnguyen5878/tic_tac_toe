import 'package:flutter_tic_tac_toe/models/online/online_player.dart';
import 'package:json_annotation/json_annotation.dart';

class OnlinePlayerListConverter implements JsonConverter<List<OnlinePlayer?>, List<Map<String, dynamic>>> {
  const OnlinePlayerListConverter();

  @override
  List<OnlinePlayer?> fromJson(List<dynamic> json) {
    List<OnlinePlayer?> result = [];
    for (var element in json) {
      if (element == null) {
        result.add(null);
      } else {
        result.add(OnlinePlayer.fromJson(element));
      }
    }
    return result;
  }

  @override
  List<Map<String, dynamic>> toJson(List<OnlinePlayer?> object) {
    return object.map((player) => player?.toJson() ?? {})
        // .cast<Map<String, dynamic>>()
        .toList();
  }
}