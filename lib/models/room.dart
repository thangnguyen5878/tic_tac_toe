// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/models/board.dart';
import 'package:flutter_tic_tac_toe/models/cell.dart';
import 'package:flutter_tic_tac_toe/models/history.dart';
import 'package:flutter_tic_tac_toe/models/player.dart';
import 'package:flutter_tic_tac_toe/models/round.dart';
import 'package:flutter_tic_tac_toe/models/score.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/cell_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/game_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'room.g.dart';

@collection
@JsonSerializable(explicitToJson: true)
class Room {
  @ignore
  String id = Uuid().v4();

  @JsonKey(includeFromJson: false, includeToJson: false)
  Id isarId = Isar.autoIncrement;

  String name = 'Untitled Room';
  DateTime createdAt = DateTime.now();
  DateTime lastAccessAt = DateTime.now();

  @Enumerated(EnumType.name)
  GameState state = GameState.playing;

  List<String> playerIds = [];

  Board board = Board();
  List<Player> players = [
    Player(index: 0, name: 'Player 1', seed: Seed.cross),
    Player(index: 1, name: 'Player 2', seed: Seed.nought)
  ];
  List<Round> rounds = [Round()];
  History history = History();

  /// Temporary list to track cells being checked for a potential winner.
  @ignore
  List<Cell> checkingCells = <Cell>[];

  final winCount = 5;

  // CONSTRUCTORS
  Room();

  Room.custom(
      {String? name,
      GameState? state,
      DateTime? createdAt,
      DateTime? lastAccessAt,
      Board? board,
      List<Player>? players,
      List<Round>? rounds,
      History? history,
      List<String>? playerIds})
      : name = name ?? 'Untitled Room',
        createdAt = createdAt ?? DateTime.now(),
        lastAccessAt = lastAccessAt ?? DateTime.now(),
        state = state ?? GameState.playing,
        board = board ?? Board(),
        players = players ??
            [
              Player(index: 0, name: 'Player 1', seed: Seed.cross),
              Player(index: 1, name: 'Player 2', seed: Seed.nought)
            ],
        rounds = rounds ?? [Round()],
        history = history ?? History(),
        playerIds = playerIds ?? [];

  // GETTERs
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
    } else {
      return null;
    }
  }

  Player? getWinnerOfRound(int roundIndex) {
    if (rounds[roundIndex].hasWinner()) {
      return players[rounds[roundIndex].winnerIndex!];
    } else {
      return null;
    }
  }

  Score getPlayer1Score() {
    return getCurrentRound().getPlayer1Score();
  }

  Score getPlayer2Score() {
    return getCurrentRound().getPlayer2Score();
  }

  // GETTERS: HISTORY
  int getTurnCountInHistory() {
    if (!isLastTurnInHistory()) {
      return history.currentTurnIndex + 1;
    } else {
      return history.currentTurnIndex; // minus 1 because there are no next turn.
    }
  }

  Round getCurrentRoundInHistory() {
    return rounds[history.currentRoundIndex];
  }

  int getRoundCountInHistory() {
    return history.currentRoundIndex + 1;
  }

  int getNextTurnCountInHistory() {
    return history.getTurnCount();
  }

  Player getCurrentPlayerInHistory() {
    return players[history.currentPlayerIndex];
  }

  int getPlayer1ScoreInHistory() {
    if (!hasWinnerInHistory()) {
      logger.i(
          'player 1 initial score: ${getCurrentRoundInHistory().getPlayer1Score().initialScore}');
      return getCurrentRoundInHistory().getPlayer1Score().initialScore;
    } else {
      logger.i('player 1 final score: ${getCurrentRoundInHistory().getPlayer1Score().finalScore}');
      return getCurrentRoundInHistory().getPlayer1Score().finalScore!;
    }
  }

  int getPlayer2ScoreInHistory() {
    if (!hasWinnerInHistory()) {
      logger.i(
          'player 2 initial score: ${getCurrentRoundInHistory().getPlayer2Score().initialScore}');
      return getCurrentRoundInHistory().getPlayer2Score().initialScore;
    } else {
      logger.i('player 2 final score: ${getCurrentRoundInHistory().getPlayer2Score().finalScore}');
      return getCurrentRoundInHistory().getPlayer2Score().finalScore!;
    }
  }

  // GETTERS: BOOLEAN, HISTORY
  bool isPlayer1WinInHistory() {
    return hasWinnerInHistory() && getCurrentRoundInHistory().isPlayer1Turn();
  }

  bool isPlayer2WinInHistory() {
    return hasWinnerInHistory() && getCurrentRoundInHistory().isPlayer2Turn();
  }

  bool hasWinnerInHistory() {
    return getCurrentRoundInHistory().hasWinner() && isLastTurnInHistory();
  }

  bool isPlayer1TurnInHistory() {
    if (!isLastTurnInHistory()) {
      return history.isPlayer1Turn();
    }
    // The figures stop at the last turn.
    return !history.isPlayer1Turn();
  }

  bool isPlayer2TurnInHistory() {
    if (!isLastTurnInHistory()) {
      return history.isPlayer2Turn();
    }
    // The figures stop at the last turn.
    return !history.isPlayer2Turn();
  }

  // GETTERS: BOOLEAN
  bool isLastTurnInHistory() {
    return history.currentTurnIndex == getCurrentRoundInHistory().turns.length;
    // Because when turnIndex = 0, there are no seed on the board.
  }

  bool isLastTurnInHistoryPlus() {
    return history.currentTurnIndex == getCurrentRoundInHistory().turns.length + 2;
  }

  bool isGameOver() {
    return state == GameState.stop;
  }

  bool isPlayer1Turn() {
    return getCurrentRound().isPlayer1Turn();
  }

  bool isPlayer2Turn() {
    return getCurrentRound().isPlayer2Turn();
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

  // METHODS: BUSINESS
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

  void handleWinOffline(int winnerIndex) {
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

  void handleWinOnline(int winnerIndex) {
    bool isPlayer1Win = winnerIndex == 0;

    if (isPlayer1Win) {
      addScoreForPlayer1(1);
      colorWinningCells(CellState.crossWin);
    } else {
      addScoreForPlayer2(1);
      colorWinningCells(CellState.noughtWin);
    }

    getCurrentRound().winnerIndex = winnerIndex;
    getPlayer1Score().updateFinalScore();
    getPlayer2Score().updateFinalScore();
    state = GameState.stop;

    OnlineUserController.to.updateWinnerAndLoserStatus();
    OnlineGameController.to.pushRoomToFirebase();
  }

  /// This method will be used to color the winning cells.
  void colorWinningCells(CellState winningState) {
    for (Cell cell in checkingCells) {
      cell.state = winningState;
    }
  }

  /// This method will log the winner and navigate to the winner screen.
  void logWinnerAndNotify() {
    if (getCurrentRound().hasWinner()) {
      Player winner = getWinnerOfCurrentRound()!;
      logger.t('Winner is ${winner.name}');
      // logger.t('rounds: $rounds');
      Get.toNamed('winner');
    }
  }

  /// This method checks if there's a winner and handles the case.
  bool checkForWinner(List<Cell> cellsToCheck, Seed seed) {
    if (isWinningRow(cellsToCheck)) {
      if (isOnline) {
        handleWinOnline(seed == Seed.cross ? 0 : 1);
        return true;
      } else {
        handleWinOffline(seed == Seed.cross ? 0 : 1);
        return true;
      }
    }
    return false;
  }

  void checkWinner() {
    if (checkLines() || checkColumns() || checkDiagonals()) {
      return; // Winner found and handled
    }
    // If no winner, move to next turn
    getCurrentRound().goToNextTurn();
  }

  bool checkLines() {
    for (int row = 0; row < board.rowCount!; row++) {
      for (int col = 0; col <= board.columnCount! - winCount; col++) {
        checkingCells.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells.add(board.cells[row][col + k]);
        }
        // Check if the first cell is not noSeed before checking for winner
        if (board.cells[row][col].content != Seed.noSeed &&
            checkForWinner(checkingCells, board.cells[row][col].content!)) {
          return true;
        }
      }
    }
    return false;
  }

  bool checkColumns() {
    for (int col = 0; col < board.columnCount!; col++) {
      for (int row = 0; row <= board.rowCount! - winCount; row++) {
        checkingCells.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells.add(board.cells[row + k][col]);
        }
        // Check if the first cell is not noSeed before checking for winner
        if (board.cells[row][col].content != Seed.noSeed &&
            checkForWinner(checkingCells, board.cells[row][col].content!)) {
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
        checkingCells.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells.add(board.cells[row + k][col + k]);
        }
        if (board.cells[row][col].content != Seed.noSeed &&
            checkForWinner(checkingCells, board.cells[row][col].content!)) {
          return true;
        }
      }
    }

    // Check ascending diagonal (/)
    for (int row = 0; row <= board.rowCount! - winCount; row++) {
      for (int col = winCount - 1; col < board.columnCount!; col++) {
        checkingCells.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells.add(board.cells[row + k][col - k]);
        }
        if (board.cells[row][col].content != Seed.noSeed &&
            checkForWinner(checkingCells, board.cells[row][col].content!)) {
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
    rounds = [...rounds, nextRound];
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
  void updateBoardInHistory() {
    history.board.reset();
    if (history.currentTurnIndex >= 0) {
      history.board.load(getCurrentRoundInHistory().turns, history.currentTurnIndex);
    }
  }

  // JSON SERIALIZATION
  Map<String, dynamic> toJson() => _$RoomToJson(this);

  factory Room.fromJson(Map<String, dynamic> json) => Room()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..lastAccessAt = DateTime.parse(json['lastAccessAt'] as String)
    ..state = $enumDecode(_$GameStateEnumMap, json['state'])
    ..board = Board.fromJson(json['board'] as Map<String, dynamic>)
    ..players = (List<Map<String, dynamic>>.from(json['players']))
        .map((e) => Player.fromJson(e as Map<String, dynamic>))
        .toList()
    ..rounds = (List<Map<String, dynamic>>.from(json['rounds']))
        .map((e) => Round.fromJson(e as Map<String, dynamic>))
        .toList()
    ..history = History.fromJson(json['history'] as Map<String, dynamic>)
    ..checkingCells = (json['checkingCells'] as List<dynamic>)
        .map((e) => Cell.fromJson(e as Map<String, dynamic>))
        .toList();

  // METHODS: LOG
  @override
  String toString() {
    return 'Room{id: $isarId, name: $name, createdAt: $createdAt, lastAccessAt: $lastAccessAt, state: $state, board: $board, players: $players, rounds: $rounds, history: $history, checkingCells: $checkingCells, winCount: $winCount}';
  }

  String toShortString() {
    return 'Room{id: $isarId, name: $name, createdAt: $createdAt, lastAccessAt: $lastAccessAt, state: $state, history: ${history.toShortString()}}';
  }

  void logInfo() {
    logger.t(this);
  }

  void logShortInfo() {
    logger.t(toShortString());
  }
}
