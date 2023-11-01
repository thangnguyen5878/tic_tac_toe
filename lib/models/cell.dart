import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:isar/isar.dart';

part 'cell.g.dart';

@embedded
class Cell {
  int? row;

  int? column;

  @Enumerated(EnumType.name)
  Seed? content;

  @Enumerated(EnumType.name)
  late CellState? state;

  Cell({this.row, this.column, Seed? content, CellState? state})
      : this.content = content ?? Seed.noSeed,
        this.state = state ?? CellState.normal;

  Cell.clone(Cell cell) {
    row = cell.row;
    column = cell.column;
    content = cell.content;
    state = cell.state;
  }

  /// Reset a cell to default state
  reset() {
    content = Seed.noSeed;
    state = CellState.normal;
  }

  @override
  String toString() {
    return '''cell($row, $column): $content, $state\n''';
  }
}
