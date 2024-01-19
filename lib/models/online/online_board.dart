import 'package:flutter_tic_tac_toe/models/offline/cell.dart';
import 'package:flutter_tic_tac_toe/utils/constants/game_constants.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:flutter_tic_tac_toe/utils/json%20converters/online_cell_list_converter2.dart';
import 'package:json_annotation/json_annotation.dart';

part 'online_board.g.dart';

@JsonSerializable(explicitToJson: true)
class OnlineBoard {
  int? rowCount;
  int? columnCount;

  // @JsonKey(includeFromJson: false, includeToJson: false)
  @CellListConverter2()
  List<List<Cell>> cells = [];

  // CONSTRUCTORS
  OnlineBoard({int? rowCount, int? columnCount})
      : rowCount = rowCount ?? defaultRowCount,
        columnCount = columnCount ?? defaultColumnCount {
    cells = List.generate(
      this.rowCount!,
      (row) => List.generate(
        this.columnCount!,
        (column) => Cell(row: row, column: column, content: Seed.noSeed, state: CellState.normal),
      ),
      growable: true,
    );
  }

  // METHODS: BUSINESS
  /// Rebuild the board with the lastest number of rows and columns
  rebuild() {
    cells = List.generate(
      rowCount!,
      (row) => List.generate(
        columnCount!,
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
    logger.t('Reset board');
  }

  factory OnlineBoard.fromJson(Map<String, dynamic> json) => _$OnlineBoardFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineBoardToJson(this);

  // METHODS: LOG
  @override
  String toString() {
    return 'OnlineBoard{rowCount: $rowCount, columnCount: $columnCount, cells: $cells}';
  }

  String toShortString() {
    return 'OnlineBoard{rowCount: $rowCount, columnCount: $columnCount}';
  }

  void logInfo() {
    logger.t(this);
  }

  void logShortInfo() {
    logger.t(toShortString());
  }
}
