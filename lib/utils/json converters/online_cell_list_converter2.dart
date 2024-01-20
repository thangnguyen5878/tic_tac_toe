import 'package:flutter_tic_tac_toe/models/cell.dart';
import 'package:json_annotation/json_annotation.dart';

class CellListConverter2 extends JsonConverter<List<List<Cell>>, Map<String, dynamic>> {
  const CellListConverter2();

  @override
  List<List<Cell>> fromJson(Map<String, dynamic> json) {
    List<List<Cell>> result = [];
    json.forEach((key, value) {
      int index = int.parse(key);
      List<Cell> cells = value.map<Cell>((cell) => Cell.fromJson(cell)).toList();
      result.insert(index, cells);
    });
    return result;
  }

  @override
  Map<String, dynamic> toJson(List<List<Cell>> object) {
    Map<String, dynamic> result = {};
    object.asMap().forEach((index, cells) {
      String key = index.toString();
      List<dynamic> value = cells.map((cell) => cell.toJson()).toList();
      result[key] = value;
    });
    return result;
  }
}
