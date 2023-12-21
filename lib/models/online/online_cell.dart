import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'online_cell.g.dart';

@JsonSerializable(explicitToJson: true)
class OnlineCell {
  int? row;
  int? column;
  Seed? content;
  late CellState? state;

  // @DocumentReferenceConverter()
  // DocumentReference<Map<String, dynamic>>? cellRef;

  OnlineCell({this.row, this.column, Seed? content, CellState? state})
      : this.content = content ?? Seed.noSeed,
        this.state = state ?? CellState.normal;

  OnlineCell.all({this.row, this.column, this.content, this.state});

  OnlineCell.clone(OnlineCell cell) {
    row = cell.row;
    column = cell.column;
    content = cell.content;
    state = cell.state;
  }

  OnlineCell.cloneReset(OnlineCell cell) {
    row = cell.row;
    column = cell.column;
    content = Seed.noSeed;
    state = CellState.normal;
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'row': this.row,
  //     'column': this.column,
  //     'content': this.content,
  //     'state': this.state.toString(),
  //   };
  // }
  //
  // factory OnlineCell.fromJson(Map<String, dynamic> map) {
  //   return OnlineCell.all(
  //     row: map['row'] as int,
  //     column: map['column'] as int,
  //     content: map['content'] as Seed,
  //     state: map['state'] as CellState,
  //   );
  // }

  factory OnlineCell.fromJson(Map<String, dynamic> json) => _$OnlineCellFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineCellToJson(this);

  @override
  String toString() {
    return '''cell($row, $column): $content, $state\n''';
  }
}
