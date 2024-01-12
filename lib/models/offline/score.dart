import 'package:flutter_tic_tac_toe/modules/offline/game/components/player_bottom_bar.dart';
import 'package:isar/isar.dart';

part 'score.g.dart';

/// The score of a player in a round.
@embedded
class Score {
  /// The current score that shown in [PlayerBottomBar].
  ///
  /// The default value is the same as [initialScore].
  int currentScore = 0;

  /// The score of the last row (if has).
  ///
  /// Default value: 0.
  int initialScore = 0;

  /// Has a value when a round is completed and a winner appears.
  ///
  /// Default vaule: null.
  int? finalScore;

  Score();

  Score.all(this.currentScore, this.initialScore, this.finalScore);

  Score.custom({int? initialScore, this.finalScore})
      : initialScore = initialScore ?? 0,
        currentScore = initialScore ?? 0;

  Score cloneForNextRound() {
    return Score.custom(initialScore: finalScore);
  }

  // boolean getters
  /// Whether there's a winner
  bool hasWinner() {
    return finalScore != null;
  }

  /// Add value for [currentScore].
  void addScore(int score) {
    currentScore += score;
  }

  /// Update [finalScore] according to [currentScore].
  void updateFinalScore() {
    finalScore = currentScore;
  }

  void reset() {
    if (hasWinner()) {
      currentScore = initialScore!;
      finalScore = null;
    }
  }
}
