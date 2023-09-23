// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tic_tac_toe/utils/cell_state.dart';
import 'package:tic_tac_toe/utils/seed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cell.g.dart';

@JsonSerializable()
class Cell {
  int row;
  int column;
  Seed content;
  CellState state;

  // cell constructor with defalt content is Seed.noSeed and state is CellState.normal
  Cell(int row, int column)
      : this.row = row,
        this.column = column,
        content = Seed.noSeed,
        state = CellState.normal;

// cell constructor with all parameters
  Cell.all(
      {required this.row,
      required this.column,
      required this.content,
      required this.state});

  // reset cell to blank
  reset() {
    content = Seed.noSeed;
    state = CellState.normal;
  }

  factory Cell.fromJson(Map<String, dynamic> json) => _$CellFromJson(json);
  Map<String, dynamic> toJson() => _$CellToJson(this);

  Cell copyWith({
    int? row,
    int? column,
    Seed? content,
    CellState? state,
  }) {
    return Cell(
      row ?? this.row,
      column ?? this.column,
    )
      ..content = content ?? this.content
      ..state = state ?? this.state;
  }

  // toString() method
  @override
  String toString() {
    return '''cell($row, $column): $content, $state\n''';
  }
}
