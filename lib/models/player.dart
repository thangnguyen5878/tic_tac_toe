import 'package:tic_tac_toe/utils/seed.dart';

class Player {
  String name;
  Seed seed;
  int score;

  Player(String name, Seed seed)
      : this.name = name,
        this.seed = seed,
        score = 0;

  @override
  String toString() {
    return 
    '''$name, Seed: $seed, Score: $score\n''';
  }
}
