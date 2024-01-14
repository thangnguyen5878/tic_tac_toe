// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_tic_tac_toe/models/offline/board.dart';
import 'package:flutter_tic_tac_toe/models/offline/cell.dart';
import 'package:flutter_tic_tac_toe/models/offline/history.dart';
import 'package:flutter_tic_tac_toe/models/offline/player.dart';
import 'package:flutter_tic_tac_toe/models/offline/round.dart';
import 'package:flutter_tic_tac_toe/models/offline/score.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/game_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

part 'room.g.dart';

@collection
class Room {
  Id id = Isar.autoIncrement;
  String name = 'Untitled Room';
  DateTime createdAt = DateTime.now();
  DateTime lasAccessAt = DateTime.now();

  @Enumerated(EnumType.name)
  GameState state = GameState.playing;

  Board board = Board();
  List<Player> players = [
    Player(index: 0, name: 'Player 1', seed: Seed.cross),
    Player(index: 1, name: 'Player 2', seed: Seed.nought)
  ];
  List<Round> rounds = [Round()];
  History history = History();

  @ignore
  List<Cell>? checkingCells = List<Cell>.empty(growable: true);

  final winCount = 5;

  Room();

  Room.all(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.lasAccessAt,
      required this.state,
      required this.board,
      required this.players,
      required this.rounds,
      required this.history});

  Room.custom(
      {String? name,
      GameState? state,
      DateTime? createdAt,
      DateTime? lastAccessAt,
      Board? board,
      List<Player>? players,
      List<Round>? rounds,
      History? history})
      : name = name ?? 'Untitled Room',
        createdAt = createdAt ?? DateTime.now(),
        lasAccessAt = lastAccessAt ?? DateTime.now(),
        state = state ?? GameState.playing,
        board = Board(),
        players = players ??
            [
              Player(index: 0, name: 'Player 1', seed: Seed.cross),
              Player(index: 1, name: 'Player 2', seed: Seed.nought)
            ],
        rounds = [Round()],
        history = History();

  // getters
  Round getCurrentRound() {
    return rounds.last;
  }

  Round getRound(int index) {
    return rounds[index];
  }

  int getRoundCount() {
    return rounds.length;
  }

  Player getCurrentPlayer() {
    return players[getCurrentRound().currentPlayerIndex];
  }

  Player getPlayer1() {
    return players[0];
  }

  Player getPlayer2() {
    return players[1];
  }

  Player? getWinnerOfCurrentRound() {
    if (getCurrentRound().hasWinner()) {
      return players[getCurrentRound().winnerIndex!];
    }
  }

  Player? getWinnerOfRound(int roundIndex) {
    if (rounds[roundIndex].hasWinner()) {
      return players[rounds[roundIndex].winnerIndex!];
    }
  }

  Score getPlayer1Score() {
    return getCurrentRound().getPlayer1Score();
  }

  Score getPlayer2Score() {
    return getCurrentRound().getPlayer2Score();
  }

  // HISTORY GETTERS
  int getHistoryTurnCount() {
    if (hasWinnerInHistory()) {
      return history.currentTurnIndex; // minus 1 because there are no next turn.
    } else {
      return history.currentTurnIndex + 1;
    }
  }

  Round getHistoryCurrentRound() {
    return rounds[history.currentRoundIndex];
  }

  int getHistoryRoundCount() {
    return history.currentRoundIndex + 1;
  }

  int getHistoryNextTurnCount() {
    return history.getTurnCount();
  }

  Player getHistoryCurrentPlayer() {
    return players[history.currentPlayerIndex];
  }

  int getHistoryPlayer1CurrentScore() {
    return getHistoryCurrentRound().getPlayer1Score().currentScore;
  }

  int getHistoryPlayer2CurrentScore() {
    return getHistoryCurrentRound().getPlayer2Score().currentScore;
  }

  // HISTORY BOOLEAN METHODS
  bool isPlayer1WinInHistory() {
    return hasWinnerInHistory() && getHistoryCurrentRound().isPlayer1Turn();
  }

  bool isPlayer2WinInHistory() {
    return hasWinnerInHistory() && getHistoryCurrentRound().isPlayer2Turn();
  }

  bool hasWinnerInHistory() {
    return history.currentTurnIndex == getHistoryCurrentRound().getTurnCount() - 1;
  }

  bool isPlayer1TurnInHistory() {
    if (hasWinnerInHistory()) {
      return !history.isPlayer1Turn(); // When a winner appears, the game stops at winner turn.
    }
    return history.isPlayer1Turn();
  }

  bool isPlayer2TurnInHistory() {
    if (hasWinnerInHistory()) {
      return !history.isPlayer2Turn(); // When a winner appears, the game stops at winner turn.
    }
    return history.isPlayer2Turn();
  }

  // BOOLEAN METHODS
  bool isGameOver() {
    return state == GameState.stop;
  }

  bool isPlayer1Win() {
    return getCurrentRound().isPlayer1Win();
  }

  bool isPlayer2Win() {
    return getCurrentRound().isPlayer2Win();
  }

  bool isRoundValidate(int roundIndex) {
    return roundIndex >= 0 && roundIndex <= rounds.length - 1;
  }

  bool hasWinnerOfCurrentRound() {
    return getCurrentRound().hasWinner();
  }

  // SETTERS
  void addScoreForPlayer1(int score) {
    getPlayer1Score().addScore(score);
  }

  void addScoreForPlayer2(int score) {
    getPlayer2Score().addScore(score);
  }

  /// Check whether adjacent cells are the same or not to check the winner
  isWinningRow(List<Cell> cells) {
    if (cells.isEmpty) {
      return false;
    }
    final firstElement = cells[0].content;
    for (int i = 1; i < cells.length; i++) {
      if (cells[i].content != firstElement) {
        return false;
      }
    }
    return true;
  }

  void handleWin(int winnerIndex) {
    bool isPlayer1Win = winnerIndex == 0;

    if (isPlayer1Win) {
      addScoreForPlayer1(1);
      colorWinningCells(CellState.crossWin);
    } else {
      addScoreForPlayer2(1);
      colorWinningCells(CellState.noughtWin);
    }

    // update winner, final score and game state
    getCurrentRound().winnerIndex = winnerIndex;
    getPlayer1Score().updateFinalScore();
    getPlayer2Score().updateFinalScore();
    state = GameState.stop;

    logWinnerAndNotify();
  }

  /// This method will be used to color the winning cells.
  void colorWinningCells(CellState winningState) {
    for (Cell cell in checkingCells!) {
      cell.state = winningState;
    }
  }

  /// This method will log the winner and navigate to the winner screen.
  void logWinnerAndNotify() {
    if (getCurrentRound().hasWinner()) {
      Player winner = getWinnerOfCurrentRound()!;
      logger.t('Winner is ${winner!.name}');
      // logger.t('rounds: $rounds');
      Get.toNamed('winner');
    }
  }

  /// This method checks if there's a winner and handles the case.
  bool checkForWinner(List<Cell> cellsToCheck, Seed seed) {
    if (isWinningRow(cellsToCheck)) {
      handleWin(seed == Seed.cross ? 0 : 1);
      return true;
    }
    return false;
  }

  void checkWinner() {
    if (checkLines() || checkColumns() || checkDiagonals()) {
      return; // Winner found and handled
    }
    // If no winner, move to next turn
    getCurrentRound().GoToNextTurn();
  }

  bool checkLines() {
    for (int row = 0; row < board.rowCount!; row++) {
      for (int col = 0; col <= board.columnCount! - winCount; col++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[row][col + k]);
        }
        // Check if the first cell is not noSeed before checking for winner
        if (board.cells[row][col].content != Seed.noSeed &&
            checkForWinner(checkingCells!, board.cells[row][col].content!)) {
          return true;
        }
      }
    }
    return false;
  }

  bool checkColumns() {
    for (int col = 0; col < board.columnCount!; col++) {
      for (int row = 0; row <= board.rowCount! - winCount; row++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[row + k][col]);
        }
        // Check if the first cell is not noSeed before checking for winner
        if (board.cells[row][col].content != Seed.noSeed &&
            checkForWinner(checkingCells!, board.cells[row][col].content!)) {
          return true;
        }
      }
    }
    return false;
  }

  bool checkDiagonals() {
    // Check descending diagonal (\)
    for (int row = 0; row <= board.rowCount! - winCount; row++) {
      for (int col = 0; col <= board.columnCount! - winCount; col++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[row + k][col + k]);
        }
        if (board.cells[row][col].content != Seed.noSeed &&
            checkForWinner(checkingCells!, board.cells[row][col].content!)) {
          return true;
        }
      }
    }

    // Check ascending diagonal (/)
    for (int row = 0; row <= board.rowCount! - winCount; row++) {
      for (int col = winCount - 1; col < board.columnCount!; col++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[row + k][col - k]);
        }
        if (board.cells[row][col].content != Seed.noSeed &&
            checkForWinner(checkingCells!, board.cells[row][col].content!)) {
          return true;
        }
      }
    }
    return false;
  }

  /// Move to the next round when a player wins and the player press the `Next round button`
  void nextRound() {
    state = GameState.playing;
    board.reset();
    Round nextRound = getCurrentRound().cloneForNextRound();
    rounds = [...?rounds, nextRound];
    // logger.t('nextRound()\n');
    // logger.t('current round: ${rounds![currentRoundIndex - 1]}\n');
    // logger.t('next round: ${rounds![currentRoundIndex]}\n');
  }

  /// Reset game to the original state
  void reset() {
    state = GameState.playing;
    board.reset();
    getCurrentRound().reset();
  }

  /// Loads [History.currentTurnIndex]+1 cells from [Round.turns] to [History.board].
  void updateHistoryBoard() {
    history.board.reset();
    // Initial (turn index: -1): no cell on the board.
    if (history.currentTurnIndex >= 0) {
      history.board.load(getHistoryCurrentRound().turns, history.currentTurnIndex);
    }
  }

  // LOGS
  @override
  String toString() {
    return 'Room{id: $id, name: $name, createdAt: $createdAt, lastModifiedAt: $lasAccessAt, state: $state, board: $board, players: $players, rounds: $rounds, history: $history, checkingCells: $checkingCells, winCount: $winCount}';
  }

  String toShortString() {
    return 'Room{id: $id, name: $name, createdAt: $createdAt, lastModifiedAt: $lasAccessAt, state: $state, checkingCells: $checkingCells, winCount: $winCount}';
  }
}
