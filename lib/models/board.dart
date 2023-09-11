import 'package:tic_tac_toe/models/cell.dart';

class Board {
  int _rows;
  int _columns;
  late List<List<Cell>> cells;

  Board({int? rows, int? columns})
      : _rows = rows ?? 5,
        _columns = columns ?? 5 {
    cells = List.generate(
      this.rows,
      (row) => List.generate(
        this.columns,
        (column) => Cell(row, column),
      ),
      growable: true,
    );
  }
  
  // getters and setters
  int get rows => _rows;
  set rows(int value) {
    _rows = value;
    cells = List.generate(
      _rows,
      (row) => List.generate(
        _columns,
        (column) => Cell(row, column),
      ),
      growable: true,
    );
  }

  int get columns => _columns;
  set columns(int value) {
    _columns = value;
    cells = List.generate(
      _rows,
      (row) => List.generate(
        _columns,
        (column) => Cell(row, column),
      ),
      growable: true,
    );
  }

  // methods
  void reset() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        cells[i][j].reset();
      }
    }
    print('Board is empty');
    print(toString());
  }

  // toString() method
  @override
  String toString() {
    return '''Board($rows, $columns)
    cells: $cells''';
  }
}
