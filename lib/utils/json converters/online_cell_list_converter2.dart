import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
import 'package:json_annotation/json_annotation.dart';

class OnlineCellListConverter2
    extends JsonConverter<List<List<OnlineCell>>, Map<String, dynamic>> {
  const OnlineCellListConverter2();

  @override
  List<List<OnlineCell>> fromJson(Map<String, dynamic> json) {
    List<List<OnlineCell>> result = [];
    json.forEach((key, value) {
      int index = int.parse(key);
      List<OnlineCell> cells = value
          .map<OnlineCell>((cell) => OnlineCell.fromJson(cell))
          .toList();
      result.insert(index, cells);
    });
    return result;
  }

  @override
  Map<String, dynamic> toJson(List<List<OnlineCell>> object) {
    Map<String, dynamic> result = {};
    object.asMap().forEach((index, cells) {
      String key = index.toString();
      List<dynamic> value = cells.map((cell) => cell.toJson()).toList();
      result[key] = value;
    });
    return result;
  }
}
