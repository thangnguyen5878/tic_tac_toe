import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
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

  @OnlineCellListConverter2()
  List<List<OnlineCell>> cells = [];

  /// OnlineBoard constructor with the default value
  OnlineBoard({int? rowCount, int? columnCount})
      : rowCount = rowCount ?? defaultOnlineRowCount,
        columnCount = columnCount ?? defaultOnlineColumnCount {
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
      rowCount!,
          (row) => List.generate(
        columnCount!,
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
    logger.t('reset online board');
  }

  factory OnlineBoard.fromJson(Map<String, dynamic> json) => _$OnlineBoardFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineBoardToJson(this);

  String toShortString() =>
      'OnlineBoard(rowCount: $rowCount, columnCount: $columnCount, cells: $cells)';

  @override
  String toString() {
    return 'OnlineBoard{rowCount: $rowCount, columnCount: $columnCount, cells: $cells}';
  }
}


