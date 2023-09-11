import 'package:tic_tac_toe/utils/cell_state.dart';
import 'package:tic_tac_toe/utils/seed.dart';

class Cell {
  int row;
  int column;
  Seed content;
  CellState state;

  Cell(int row, int column)
      : this.row = row,
        this.column = column,
        content = Seed.noSeed,
        state = CellState.normal;

  reset() {
    content = Seed.noSeed;
    state = CellState.normal;
  }

  // toString() method
  @override
  String toString() {
    return '''cell($row, $column): $content, $state\n''';
  }
}
