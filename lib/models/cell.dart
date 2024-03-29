import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cell.g.dart';

/// A class that represents a single cell in a tic tac toe game.
///
/// A cell contains a row and column index, a content (which can be either an X or an O), and a state (which can be empty, player 1's turn, player 2's turn, or a win for a specific player).
@embedded
@JsonSerializable(explicitToJson: true)
class Cell {
  /// The row index of the cell.
  int? row;

  /// The column index of the cell.
  int? column;

  /// The content of the cell (an X or an O).
  @Enumerated(EnumType.name)
  Seed? content;

  /// The state of the cell (empty, player 1's turn, player 2's turn, or a win for a specific player).
  @Enumerated(EnumType.name)
  late CellState? state;

  // CONSTRUCTORS
  Cell({this.row, this.column, Seed? content, CellState? state})
      : content = content ?? Seed.noSeed,
        state = state ?? CellState.normal;

  Cell.custom({this.row, this.column, Seed? content, CellState? state})
      : content = content ?? Seed.noSeed,
        state = state ?? CellState.normal;

  // METHODS: CLONE
  /// Creates a new cell that is a clone of the specified cell.
  Cell.clone(Cell cell) {
    row = cell.row;
    column = cell.column;
    content = cell.content;
    state = cell.state;
  }

  /// Creates a new cell that is a clone of the specified cell, but with the content reset to no seed.
  Cell.cloneReset(Cell cell) {
    row = cell.row;
    column = cell.column;
    content = Seed.noSeed;
    state = CellState.normal;
  }

  // GETTERS: BOOLEAN
  /// Returns whether the cell represents a win for player 1.
  bool get isPlayer1Win => state == CellState.crossWin;

  /// Returns whether the cell represents a win for player 2.
  bool get isPlayer2Win => state == CellState.noughtWin;

  // JSON SERIALIZATION
  factory Cell.fromJson(Map<String, dynamic> json) => _$CellFromJson(json);

  Map<String, dynamic> toJson() => _$CellToJson(this);

  // METHODS: LOG
  /// Returns a string representation of the cell, including its row, column, content, and state.
  @override
  String toString() {
    return 'Cell{row: $row, column: $column, content: $content, state: $state}';
  }

  /// Returns a string representation of the cell's content.
  String toStringContent() {
    return '$content';
  }

  /// Logs information about the cell to the console.
  void logInfo() {
    logger.t(this);
  }
}
