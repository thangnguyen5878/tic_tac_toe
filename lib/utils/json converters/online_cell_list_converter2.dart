import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'online_cell_list_converter2.g.dart';

class OnlineCellListConverter2
    extends JsonConverter<List<List<OnlineCell>>, Map<String, dynamic>> {
  const OnlineCellListConverter2();

  @override
  List<List<OnlineCell>> fromJson(Map<String, dynamic> json) {
    // Convert the map to a list of lists of OnlineCell objects
    List<List<OnlineCell>> result = [];
    json.forEach((key, value) {
      // The key is the index of the outer list
      int index = int.parse(key);
      // The value is a list of maps representing OnlineCell objects
      List<OnlineCell> cells = value
          .map<OnlineCell>((cell) => OnlineCell.fromJson(cell))
          .toList();
      // Add the cells to the result at the correct index
      result.insert(index, cells);
    });
    return result;
  }

  @override
  Map<String, dynamic> toJson(List<List<OnlineCell>> object) {
    // Convert the list of lists of OnlineCell objects to a map
    Map<String, dynamic> result = {};
    object.asMap().forEach((index, cells) {
      // The index is the key of the map
      String key = index.toString();
      // The cells are a list of maps representing OnlineCell objects
      List<dynamic> value = cells.map((cell) => cell.toJson()).toList();
      // Add the key-value pair to the result
      result[key] = value;
    });
    return result;
  }
}
