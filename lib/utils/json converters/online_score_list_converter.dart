import 'package:flutter_tic_tac_toe/models/online/online_score.dart';
import 'package:json_annotation/json_annotation.dart';

class OnlineScoreListConverter
    implements JsonConverter<List<OnlineScore>, List<Map<String, dynamic>>> {
  const OnlineScoreListConverter();

  @override
  List<OnlineScore> fromJson(List<Map<String, dynamic>> json) =>
      json.map((e) => OnlineScore.fromJson(e)).toList();

  @override
  List<Map<String, dynamic>> toJson(List<OnlineScore> object) =>
      object.map((e) => e.toJson()).toList();
}
