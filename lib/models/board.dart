// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_tic_tac_toe/models/cell.dart';
import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:isar/isar.dart';

part 'board.g.dart';

@embedded
class Board {
  int? rowCount;

  int? columnCount;

  @ignore
  late List<List<Cell>> cells;

  /// Board constructor with the default 5x5 board
  Board({int? rowCount, int? columnCount})
      : rowCount = rowCount ?? 10,
        columnCount = columnCount ?? 10 {
    cells = List.generate(
      this.rowCount!,
      (row) => List.generate(
        this.columnCount!,
        (column) => Cell(row: row, column: column, content: Seed.noSeed, state: CellState.normal),
      ),
      growable: true,
    );
  }

  /// Rebuild the board with the lastest number of rows and columns
  rebuild() {
    cells = List.generate(
      this.rowCount!,
      (row) => List.generate(
        this.columnCount!,
        (column) => Cell(row: row, column: column, content: Seed.noSeed, state: CellState.normal),
      ),
      growable: true,
    );
  }

  /// Load from turns list to the board
  void loadAll(List<Cell?> turns) {
    for (int t = 0; t < turns.length; t++) {
      int row = turns[t]!.row!;
      int column = turns[t]!.column!;
      cells[row][column] = Cell.clone(turns[t]!);
    }
  }

  void load(List<Cell?> turns, int size) {
    for (int t = 0; t < size; t++) {
      int row = turns[t]!.row!;
      int column = turns[t]!.column!;
      cells[row][column] = Cell.clone(turns[t]!);
    }
  }

  /// Reset all cells in the board
  void reset() {
    for (int i = 0; i < rowCount!; i++) {
      for (int j = 0; j < columnCount!; j++) {
        cells[i][j] = Cell.cloneReset(cells[i][j]);
      }
    }
    print('Reset board');
  }

  @override
  String toString() =>
      'Board(rowCount: $rowCount, columnCount: $columnCount, cells: $cells)';
}
