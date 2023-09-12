import 'package:tic_tac_toe/models/player.dart';
import 'package:tic_tac_toe/utils/round_state.dart';

class Round {
  int number;
  Player? winner;
  int turnCount;
  RoundState state;


  Round(int number) : this.number = 0, state = RoundState.playing, turnCount = 0;

  @override
  String toString() {
    return 'Round $number, $state, turnCount: $turnCount, winner: $winner\n';
  }
}
