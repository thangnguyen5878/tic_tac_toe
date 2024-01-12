// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_tic_tac_toe/models/offline/cell.dart';
import 'package:flutter_tic_tac_toe/models/offline/score.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:isar/isar.dart';

part 'round.g.dart';

@embedded
class Round {
  /// Index references to a round in [Room.rounds].
  int index = 0;

  /// Index references to the current player in [Room.players].
  int currentPlayerIndex = 0;

  /// Index references to the winner in [Room.players].
  int? winnerIndex;

  /// Container that stores all the drawn [Cell] on the board in order.
  List<Cell?> turns = [];

  /// Scores of 2 players in this round.
  List<Score> scores = [Score(), Score()];

  Round();

  Round.custom(
      {int? index,
      int? currentPlayerIndex,
      this.winnerIndex,
      List<Cell>? turns,
      List<Score>? scores})
      : index = index ?? 0,
        currentPlayerIndex = 0,
        turns = turns ?? [],
        scores = scores ?? [Score(), Score()];

  Round.all(
      this.index, this.currentPlayerIndex, this.winnerIndex, this.turns, this.scores); // getters
  // round
  int getRoundCount() {
    return index! + 1;
  }

  // turns
  int getTurnCount() {
    return turns.length + 1;
  }

  // getters history
  // Player getCurrentHistoryPlayer() {
  //   return players![_historyPlayerIndex!];
  // }

  // int getHistoryPlayerIndex() {
  //   return isHistoryWinTurn() ? winnerIndex! : _historyPlayerIndex!;
  // }

  // int getHistoryPlayer1Score() {
  //   return isHistoryWinTurn() ? getPlayer1().finalScore! : getPlayer1().initialScore!;
  // }

  // int getHistoryPlayer2Score() {
  //   return isHistoryWinTurn() ? getPlayer2().finalScore! : getPlayer2().initialScore!;
  // }

  Cell? getLastTurn() {
    return turns.last;
  }

  Score getPlayer1Score() {
    return scores[0];
  }

  Score getPlayer2Score() {
    return scores[1];
  }

  Score? getWinnerScore() {
    if (hasWinner()) {
      return scores[winnerIndex!];
    }
  }

  // Cell getHistoryTurn() {
  //   return turns[historyTurnIndex!]!;
  // }

  // int getHistoryTurnCount() {
  //   return isHistoryWinTurn() ? winTurnIndex! + 1 : historyTurnIndex! + 1;
  // }

  // check
  // bool isHistoryWinTurn() {
  //   return winTurnIndex != null && historyTurnIndex == winTurnIndex! + 1;
  // }

  bool hasWinner() {
    return winnerIndex != null;
  }

  bool isPlayer1Win() {
    return hasWinner() && winnerIndex == 0;
  }

  bool isPlayer2Win() {
    return hasWinner() && winnerIndex == 1;
  }

  Round cloneForNextRound() {
    logger.t('clone next round');
    return Round.custom(
      index: index + 1,
      scores: [getPlayer1Score().cloneForNextRound(), getPlayer2Score().cloneForNextRound()],
    );
  }

  reset() {
    if (hasWinner()) {
      getWinnerScore()!.reset();
      winnerIndex = null;
    }
    turns = [];
    currentPlayerIndex = 0;
  }

  // resetHistory() {
  //   _historyPlayerIndex = 0;
  //   historyTurnIndex = 0;
  //   historyTurns = [];
  // }

  /// When draw Seed at a cell, automatically change to next turn.
  nextTurn() {
    // toggle player
    if (currentPlayerIndex == 0) {
      currentPlayerIndex = 1;
    } else {
      currentPlayerIndex = 0;
    }
    // turns = [...turns, cell];
    // logger.t('next turn, current player: ${currentPlayerIndex! + 1}');
  }

  @override
  String toString() {
    return 'Round{index: $index, currentPlayerIndex: $currentPlayerIndex, winnerIndex: $winnerIndex, turns: $turns, scores: $scores}';
  }

  String toShortString() {
    return 'Round{index: $index, currentPlayerIndex: $currentPlayerIndex, winnerIndex: $winnerIndex, scores: $scores}';
  }

// historyNextTurn() {
  //   if (_historyPlayerIndex == 0) {
  //     _historyPlayerIndex = 1;
  //   } else {
  //     _historyPlayerIndex = 0;
  //   }
  //   historyTurnIndex = historyTurnIndex! + 1;
  //   // if (historyCurrentTurnIndex! >= winTurnIndex! - 1) {
  //   //   historyCurrentPlayerIndex = winnerIndex;
  //   //   historyCurrentTurnIndex = winTurnIndex;
  //   // }
  //   // logger.t('next turn, current player: ${historyCurrentPlayerIndex! + 1}');
  // }

  // void historyPreviousTurn() {
  //   // if (historyCurrentTurnIndex == 1) {
  //   //   historyCurrentPlayerIndex = null;
  //   // }
  //   if (_historyPlayerIndex == 0) {
  //     _historyPlayerIndex = 1;
  //   } else {
  //     _historyPlayerIndex = 0;
  //   }
  //   historyTurnIndex = historyTurnIndex! - 1;
  //   logger.t('next turn, current player: ${_historyPlayerIndex! + 1}');
  // }
}
