import 'package:flutter_tic_tac_toe/models/online/online_round.dart';
import 'package:json_annotation/json_annotation.dart';

class OnlineRoundListConverter
    implements JsonConverter<List<OnlineRound?>, List<Map<String, dynamic>>> {
  const OnlineRoundListConverter();

  @override
  List<OnlineRound?> fromJson(List<Map<String, dynamic>> json) {
    return json.map((map) => OnlineRound.fromJson(map)).toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<OnlineRound?> object) {
    return object
        .map((round) => round?.toJson() ?? {})
        // .cast<Map<String, dynamic>>()
        .toList();
  }
}
