// A converter class for OnlineCell lists
import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
import 'package:json_annotation/json_annotation.dart';

class OnlineCellListConverter implements JsonConverter<List<OnlineCell?>, List<Map<String, dynamic>>> {
  const OnlineCellListConverter();

  @override
  List<OnlineCell?> fromJson(List<Map<String, dynamic>> json) {
    // Convert each map in the list to an OnlineCell object
    return json.map((map) => OnlineCell.fromJson(map)).toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<OnlineCell?> object) {
    // Convert each OnlineCell object in the list to a map
    return object.map((cell) => cell?.toJson() ?? {})
    // Cast the list to the expected type
        .cast<Map<String, dynamic>>()
        .toList();
  }
}