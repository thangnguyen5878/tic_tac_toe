enum Seed {
  cross,
  nought,
  noSeed,
}
extension SeedExtension on Seed {
  String toStringValue() {
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
}

