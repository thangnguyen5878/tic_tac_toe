import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'online_board.g.dart';

@JsonSerializable(explicitToJson: true)
class OnlineBoard {
  int? rowCount;
  int? columnCount;

  // @NestedOnlineCellListConverter()
  List<List<OnlineCell>> cells = [];

  // @DocumentReferenceConverter()
  // DocumentReference<Map<String, dynamic>>? boardRef;

  /// OnlineBoard constructor with the default 5x5 board
  OnlineBoard({int? rowCount, int? columnCount})
      : rowCount = rowCount ?? 10,
        columnCount = columnCount ?? 10 {
    cells = List.generate(
      this.rowCount!,
          (row) => List.generate(
        this.columnCount!,
            (column) => OnlineCell(row: row, column: column, content: Seed.noSeed, state: CellState.normal),
      ),
      growable: true,
    );
  }

  OnlineBoard.all({this.rowCount, this.columnCount, required this.cells});

  /// Rebuild the board with the lastest number of rows and columns
  rebuild() {
    cells = List.generate(
      this.rowCount!,
          (row) => List.generate(
        this.columnCount!,
            (column) => OnlineCell(row: row, column: column, content: Seed.noSeed, state: CellState.normal),
      ),
      growable: true,
    );
  }

  /// Load from turns list to the board
  void loadAll(List<OnlineCell?> turns) {
    for (int t = 0; t < turns.length; t++) {
      int row = turns[t]!.row!;
      int column = turns[t]!.column!;
      cells[row][column] = OnlineCell.clone(turns[t]!);
    }
  }

  void load(List<OnlineCell?> turns, int size) {
    for (int t = 0; t < size; t++) {
      int row = turns[t]!.row!;
      int column = turns[t]!.column!;
      cells[row][column] = OnlineCell.clone(turns[t]!);
    }
  }

  /// Reset all cells in the board
  void reset() {
    for (int i = 0; i < rowCount!; i++) {
      for (int j = 0; j < columnCount!; j++) {
        cells[i][j] = OnlineCell.cloneReset(cells[i][j]);
      }
    }
    print('Reset board');
  }

  factory OnlineBoard.fromJson(Map<String, dynamic> json) => _$OnlineBoardFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineBoardToJson(this);

  @override
  String toString() =>
      'OnlineBoard(rowCount: $rowCount, columnCount: $columnCount, cells: $cells)';

  // Map<String, dynamic> toJson() {
  //   return {
  //     'rowCount': this.rowCount,
  //     'columnCount': this.columnCount,
  //     'cells': this.cells,
  //   };
  // }
  //
  // factory OnlineBoard.fromJson(Map<String, dynamic> map) {
  //   return OnlineBoard.all(
  //     rowCount: map['rowCount'] as int,
  //     columnCount: map['columnCount'] as int,
  //     cells: map['cells'] as List<List<OnlineCell>>,
  //   );
  // }
}


