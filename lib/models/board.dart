// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tic_tac_toe/models/cell.dart';
import 'package:json_annotation/json_annotation.dart';

part 'board.g.dart';

@JsonSerializable(explicitToJson: true)
class Board {
  int _rows;
  int _columns;
  late List<List<Cell>> cells;

  // board constructor with default values
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

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);
  Map<String, dynamic> toJson() => _$BoardToJson(this);

  Board copyWith({
    int? rows,
    int? columns,
    List<List<Cell>>? cells,
  }) {
    return Board(
      rows: rows ?? _rows,
      columns: columns ?? _columns,
    )..cells = cells ?? List.generate(
        _rows,
        (row) => List.generate(
          _columns,
          (column) => Cell(row, column),
        ),
        growable: true,
      );
  }
  

  // toString() method
  @override
  String toString() => 'Board(_rows: $_rows, _columns: $_columns, cells: $cells)';
}
