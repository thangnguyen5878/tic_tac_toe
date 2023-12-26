import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
import 'package:json_annotation/json_annotation.dart';

class OnlineCellListConverter implements JsonConverter<List<OnlineCell?>, List<Map<String, dynamic>>> {
  const OnlineCellListConverter();

  @override
  List<OnlineCell?> fromJson(List<dynamic> json) {
    List<OnlineCell?> result = [];
    for (var element in json) {
      if (element == null) {
        result.add(null);
      } else {
        result.add(OnlineCell.fromJson(element));
      }
    }
    return result;
  }

  @override
  List<Map<String, dynamic>> toJson(List<OnlineCell?> object) {
    return object.map((cell) => cell?.toJson() ?? {})
        // .cast<Map<String, dynamic>>()
        .toList();
  }
}