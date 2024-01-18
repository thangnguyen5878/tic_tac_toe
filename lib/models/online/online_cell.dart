import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'online_cell.g.dart';

/// A class representing a single cell in the tic tac toe game.
///
/// An [OnlineCell] object contains the row and column indices of the cell,
/// the [Seed] that is currently in the cell, and the [CellState] of the cell.
///
/// The [OnlineCell] class also provides methods for creating and manipulating
/// cells, as well as converting them to and from JSON.
@JsonSerializable(explicitToJson: true)
class OnlineCell {
  /// The row index of the cell.
  int? row;

  /// The column index of the cell.
  int? column;

  /// The [Seed] that is currently in the cell.
  Seed? content;

  /// The [CellState] of the cell.
  late CellState? state;

  // CONSTRUCTORS
  /// Creates a new cell with the specified properties.
  ///
  /// If no content is specified, the cell will have no content. If no state is specified, the cell will have the default state of "normal".
  OnlineCell({this.row, this.column, Seed? content, CellState? state})
      : content = content ?? Seed.noSeed,
        state = state ?? CellState.normal;

  /// Creates a new cell with the specified properties.
  ///
  /// If no content is specified, the cell will have no content. If no state is specified, the cell will have the default state of "normal".
  OnlineCell.custom({this.row, this.column, Seed? content, CellState? state})
      : content = content ?? Seed.noSeed,
        state = state ?? CellState.normal;

  // METHODS: CLONE
  /// Creates a new cell that is a clone of the specified cell.
  OnlineCell.clone(OnlineCell cell) {
    row = cell.row;
    column = cell.column;
    content = cell.content;
    state = cell.state;
  }

  /// Creates a new cell that is a clone of the specified cell, but with the content reset to no seed.
  OnlineCell.cloneReset(OnlineCell cell) {
    row = cell.row;
    column = cell.column;
    content = Seed.noSeed;
    state = CellState.normal;
  }

  // METHODS: BOOLEAN
  /// Returns whether the cell represents a win for player 1.
  bool isPlayer1Win() {
    return state == CellState.crossWin;
  }

  /// Returns whether the cell represents a win for player 2.
  bool isPlayer2Win() {
    return state == CellState.noughtWin;
  }

  // JSON SERIALIZATION
  factory OnlineCell.fromJson(Map<String, dynamic> json) => _$OnlineCellFromJson(json);
  Map<String, dynamic> toJson() => _$OnlineCellToJson(this);

  // METHODS: LOG
  /// Returns a string representation of the cell, including its row, column, content, and state.
  @override
  String toString() {
    return 'OnlineCell{row: $row, column: $column, content: $content, state: $state}';
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
