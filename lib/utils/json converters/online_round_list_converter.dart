import 'package:flutter_tic_tac_toe/models/offline/round.dart';
import 'package:json_annotation/json_annotation.dart';

class RoundListConverter implements JsonConverter<List<Round?>, List<Map<String, dynamic>>> {
  const RoundListConverter();

  @override
  List<Round?> fromJson(List<Map<String, dynamic>> json) {
    return json.map((map) => Round.fromJson(map)).toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<Round?> object) {
    return object
        .map((round) => round?.toJson() ?? {})
        // .cast<Map<String, dynamic>>()
        .toList();
  }
}
