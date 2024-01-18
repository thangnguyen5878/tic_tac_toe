import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:isar/isar.dart';

part 'cell.g.dart';

@embedded
class Cell {
  int? row;

  int? column;

  @Enumerated(EnumType.name)
  Seed? content;

  @Enumerated(EnumType.name)
  late CellState? state;

  // CONSTRUCTORS
  Cell({this.row, this.column, Seed? content, CellState? state})
      : content = content ?? Seed.noSeed,
        state = state ?? CellState.normal;

  Cell.clone(Cell cell) {
    row = cell.row;
    column = cell.column;
    content = cell.content;
    state = cell.state;
  }

  Cell.cloneReset(Cell cell) {
    row = cell.row;
    column = cell.column;
    content = Seed.noSeed;
    state = CellState.normal;
  }

  // METHODS: BOOLEAN
  bool isPlayer1Win() {
    return state == CellState.crossWin;
  }

  bool isPlayer2Win() {
    return state == CellState.noughtWin;
  }

  // METHODS: LOGS
  @override
  String toString() {
    return 'Cell{row: $row, column: $column, content: $content, state: $state}';
  }

  String toStringContent() {
    return '$content';
  }

  void logInfo() {
    logger.t(this);
  }
}
