import 'package:tic_tac_toe/models/cell.dart';

class Board {
  int _rows;
  int _columns;
  List<List<Cell?>>? _cells;

  // Constructor with default values
  Board({int rows = 5, int columns = 5})
      : _rows = rows,
        _columns = columns {
    // Initialize the _cells list using the provided rows and columns
    _cells = List.generate(
      _rows,
      (row) => List.generate(
        _columns,
        (column) => Cell(row, column),
      ),
      growable: true,
    );
  }

  // Getters and Setters
  int get rows => _rows;
  set rows(int rows) {
    _rows = rows;
  }

  int get columns => _columns;
  set columns(int columns) {
    _columns = columns;
  }

  List<List<Cell?>>? get cells => _cells;
  set cells(List<List<Cell?>>? cells) {
    _cells = cells;
  }

  // toString() method
  @override
  String toString() {
    return 'Board \n rows: $_rows, columns: $_columns, \n cells: $_cells \n}';
  }
}
