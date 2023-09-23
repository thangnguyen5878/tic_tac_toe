enum Seed {
  cross,
  nought,
  noSeed;

  @override
  String toString() {
    switch (this) {
      case Seed.cross:
        return "X";
      case Seed.nought:
        return "O";
      case Seed.noSeed:
        return "";
      default:
        return "";
    }
  }

  static Seed fromString(String value) {
    switch (value) {
      case "X":
        return Seed.cross;
      case "O":
        return Seed.nought;
      default:
        return Seed.noSeed;
    }
  }
}

