enum CellState {
  normal,
  crossWin,
  noughtWin;

  @override
  String toString() {
    switch (this) {
      case CellState.normal:
        return "normal";
      case CellState.crossWin:
        return "crossWin";
      case CellState.noughtWin:
        return "noughtWin";
      default:
        return "";
    }
  }

  static CellState fromString(String value) {
    switch (value) {
      case "crossWin":
        return CellState.crossWin;
      case "noughtWin":
        return CellState.noughtWin;
      default:
        return CellState.normal;
    }
  }
}
