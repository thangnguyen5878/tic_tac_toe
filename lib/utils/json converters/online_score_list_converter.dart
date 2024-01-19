import 'package:flutter_tic_tac_toe/models/offline/score.dart';
import 'package:json_annotation/json_annotation.dart';

class ScoreListConverter implements JsonConverter<List<Score>, List<Map<String, dynamic>>> {
  const ScoreListConverter();

  @override
  List<Score> fromJson(List<Map<String, dynamic>> json) =>
      json.map((e) => Score.fromJson(e)).toList();

  @override
  List<Map<String, dynamic>> toJson(List<Score> object) => object.map((e) => e.toJson()).toList();
}
