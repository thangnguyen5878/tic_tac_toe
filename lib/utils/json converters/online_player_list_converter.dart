// A converter class for OnlinePlayer lists
import 'package:flutter_tic_tac_toe/models/online/online_player.dart';
import 'package:json_annotation/json_annotation.dart';

class OnlinePlayerListConverter implements JsonConverter<List<OnlinePlayer?>, List<Map<String, dynamic>>> {
  const OnlinePlayerListConverter();

  @override
  List<OnlinePlayer?> fromJson(List<Map<String, dynamic>> json) {
    // Convert each map in the list to an OnlinePlayer object
    return json.map((map) => OnlinePlayer.fromJson(map)).toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<OnlinePlayer?> object) {
    // Convert each OnlinePlayer object in the list to a map
    return object.map((player) => player?.toJson() ?? {})
    // Cast the list to the expected type
        .cast<Map<String, dynamic>>()
        .toList();
  }

}