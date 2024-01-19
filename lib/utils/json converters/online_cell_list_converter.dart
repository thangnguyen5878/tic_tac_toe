import 'package:flutter_tic_tac_toe/models/offline/cell.dart';
import 'package:json_annotation/json_annotation.dart';

class CellListConverter implements JsonConverter<List<Cell?>, List<Map<String, dynamic>>> {
  const CellListConverter();

  @override
  List<Cell?> fromJson(List<dynamic> json) {
    List<Cell?> result = [];
    for (var element in json) {
      if (element == null) {
        result.add(null);
      } else {
        result.add(Cell.fromJson(element));
      }
    }
    return result;
  }

  @override
  List<Map<String, dynamic>> toJson(List<Cell?> object) {
    return object
        .map((cell) => cell?.toJson() ?? {})
        // .cast<Map<String, dynamic>>()
        .toList();
  }
}
