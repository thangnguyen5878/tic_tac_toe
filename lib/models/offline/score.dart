import 'package:flutter_tic_tac_toe/modules/offline/game/components/player_bottom_bar.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:isar/isar.dart';

part 'score.g.dart';

/// Player's score within a round.
@embedded
class Score {
  /// Player's current score within a round.
  ///
  /// - Initial value: Initialized to the same value as [initialScore].
  /// - Display: Shown in the [PlayerBottomBar] on the [GamePage].
  int currentScore = 0;

  /// Player's starting score in a round.
  ///
  /// - Initial value:
  /// - 0 if it's the first round (no previous scores).
  /// - Equal to the [finalScore] of the previous round otherwise.
  /// - Display: Shown in the [HistoryPlayerBottomBar] on the [HistoryDetailsPage].
  int initialScore = 0;

  /// Player's final score in a round.
  ///
  /// - Calculated: Determined at the end of the round.
  /// - Display: Shown in the [HistoryPlayerBottomBar] on the [HistoryDetailsPage].
  int? finalScore;

  // CONSTRUCTORS
  Score();

  Score.all(this.currentScore, this.initialScore, this.finalScore);

  Score.custom({int? initialScore, this.finalScore})
      : initialScore = initialScore ?? 0,
        currentScore = initialScore ?? 0;

  // GETTERS: BOOLEAN
  /// Whether there's a winner
  bool hasWinner() {
    return finalScore != null;
  }

  // METHODS: CLONE
  Score cloneForNextRound() {
    return Score.custom(initialScore: finalScore);
  }

  // METHODS: BUSINESS
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

  // METHODS: LOG
  @override
  String toString() {
    return 'Score{currentScore: $currentScore, initialScore: $initialScore, finalScore: $finalScore}';
  }

  void logInfo() {
    logger.t(this);
  }
}
