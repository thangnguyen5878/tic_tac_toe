import 'package:tic_tac_toe/utils/constants/cell_status.dart';

class Cell {
  int? _row;
  int? _column;
  late final String _content;
  late final CellStatus _status;

  Cell(int row, int column) {
    this._row = row;
    this._column = column;
    this._content = '';
    this._status = CellStatus.normal;
  }

  // Getters and Setters
  int? get row => _row;
  set row(int? newRow) {
    _row = newRow;
  }

  int? get column => _column;
  set column(int? newColumn) {
    _column = newColumn;
  }

  String get content => _content;
  set content(String newContent) {
    _content = newContent;
  }

  CellStatus get status => _status;
  set status(CellStatus newStatus) {
    _status = newStatus;
  }


  reset() {
    _content = '';
    _status = CellStatus.normal; 
  }

  // toString() method
  @override
  String toString() {
    return 'Cell \n rows: $_row, columns: $_column, \n content: $_content, status = $_status \n';
  }
}