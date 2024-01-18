import 'package:flutter_tic_tac_toe/modules/offline/game/components/player_bottom_bar.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'online_score.g.dart';

/// A class representing a player's score within a round.
@JsonSerializable(explicitToJson: true)
class OnlineScore {
  /// The player's current score within a round.
  ///
  /// - Initial value: Initialized to 0.
  /// - Displayed: Shown in the [PlayerBottomBar] on the [GamePage].
  int currentScore = 0;

  /// The player's initial score in a round.
  ///
  /// - Initial value:
  /// - 0 if it's the first round (no previous scores).
  /// - Equal to the [finalScore] of the previous round otherwise.
  /// - Displayed: Shown in the [HistoryPlayerBottomBar] on the [HistoryDetailsPage].
  int initialScore = 0;

  /// The player's final score in a round.
  ///
  /// - Calculated: Determined at the end of the round.
  /// - Displayed: Shown in the [HistoryPlayerBottomBar] on the [HistoryDetailsPage].
  int? finalScore;

  // CONSTRUCTORS
  OnlineScore();

  OnlineScore.all(this.currentScore, this.initialScore, this.finalScore);

  OnlineScore.custom({int? initialScore, this.finalScore})
      : initialScore = initialScore ?? 0,
        currentScore = initialScore ?? 0;

  // GETTERS: BOOLEAN
  /// Returns whether the player has a winner.
  bool hasWinner() {
    return finalScore != null;
  }

  // METHODS: CLONE
  /// Creates a clone of the score for the next round.
  OnlineScore cloneForNextRound() {
    return OnlineScore.custom(initialScore: finalScore);
  }

  // METHODS: BUSINESS
  /// Adds the specified score to the player's current score.
  void addScore(int score) {
    currentScore += score;
  }

  /// Updates the player's final score based on their current score.
  void updateFinalScore() {
    finalScore = currentScore;
  }

  /// Resets the player's score.
  void reset() {
    if (hasWinner()) {
      currentScore = initialScore;
      finalScore = null;
    }
  }

  // METHODS: LOG
  @override
  String toString() {
    return 'OnlineScore{currentScore: $currentScore, initialScore: $initialScore, finalScore: $finalScore}';
  }

  /// Logs information about the score.
  void logInfo() {
    logger.t(this);
  }
}
