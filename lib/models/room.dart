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
  Round get currentRound => rounds.last;

  int get roundCount => rounds.length;

  Player get currentPlayer => players[currentRound.currentPlayerIndex];

  Player get player1 => players[0];

  Player get player2 => players[1];

  Player? get winnerOfCurrentRound =>
      currentRound.hasWinner ? players[currentRound.winnerIndex!] : null;

  Player? winnerOfRound(int roundIndex) =>
      rounds[roundIndex].hasWinner ? players[rounds[roundIndex].winnerIndex!] : null;

  Score get player1Score => currentRound.player1Score;

  Score get player2Score => currentRound.player2Score;

// GETTERS: HISTORY
  int get turnCountInHistory =>
      !isLastTurnInHistory ? history.currentTurnIndex + 1 : history.currentTurnIndex;

  Round get currentRoundInHistory => rounds[history.currentRoundIndex];

  int get roundCountInHistory => history.currentRoundIndex + 1;

  int get nextTurnCountInHistory => history.turnCount;

  Player get currentPlayerInHistory => players[history.currentPlayerIndex];

  int get player1ScoreInHistory => !hasWinnerInHistory
      ? currentRoundInHistory.player1Score.initialScore
      : currentRoundInHistory.player1Score.finalScore!;

  int get player2ScoreInHistory => !hasWinnerInHistory
      ? currentRoundInHistory.player2Score.initialScore
      : currentRoundInHistory.player2Score.finalScore!;

// GETTERS: BOOLEAN, HISTORY
  bool get isPlayer1WinInHistory => hasWinnerInHistory && currentRoundInHistory.isPlayer1Turn;

  bool get isPlayer2WinInHistory => hasWinnerInHistory && currentRoundInHistory.isPlayer2Turn;

  bool get hasWinnerInHistory => currentRoundInHistory.hasWinner && isLastTurnInHistory;

  bool get isPlayer1TurnInHistory =>
      !isLastTurnInHistory ? history.isPlayer1Turn : !history.isPlayer1Turn;

  bool get isPlayer2TurnInHistory =>
      !isLastTurnInHistory ? history.isPlayer2Turn : !history.isPlayer2Turn;

// GETTERS: BOOLEAN
  bool get isLastTurnInHistory => history.currentTurnIndex == currentRoundInHistory.turns.length;

  bool get isLastTurnInHistoryPlus =>
      history.currentTurnIndex == currentRoundInHistory.turns.length + 2;

  bool get isGameOver => state == GameState.stop;

  bool get isPlayer1Turn => currentRound.isPlayer1Turn;

  bool get isPlayer2Turn => currentRound.isPlayer2Turn;

  bool get isPlayer1Win => currentRound.isPlayer1Win;

  bool get isPlayer2Win => currentRound.isPlayer2Win;

  bool roundValidate(int roundIndex) => roundIndex >= 0 && roundIndex <= rounds.length - 1;

  bool hasWinnerOfCurrentRound() {
    return currentRound.hasWinner;
  }

  // SETTERS
  void addScoreForPlayer1(int score) {
    player1Score.addScore(score);
  }

  void addScoreForPlayer2(int score) {
    player2Score.addScore(score);
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
    currentRound.winnerIndex = winnerIndex;
    player1Score.updateFinalScore();
    player2Score.updateFinalScore();
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

    currentRound.winnerIndex = winnerIndex;
    player1Score.updateFinalScore();
    player2Score.updateFinalScore();
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
    if (currentRound.hasWinner) {
      Player winner = winnerOfCurrentRound!;
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
    currentRound.goToNextTurn();
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
    Round nextRound = currentRound.cloneForNextRound();
    rounds = [...rounds, nextRound];
    // logger.t('nextRound()\n');
    // logger.t('current round: ${rounds![currentRoundIndex - 1]}\n');
    // logger.t('next round: ${rounds![currentRoundIndex]}\n');
  }

  /// Reset game to the original state
  void reset() {
    state = GameState.playing;
    board.reset();
    currentRound.reset();
  }

  /// Loads [History.currentTurnIndex]+1 cells from [Round.turns] to [History.board].
  void updateBoardInHistory() {
    history.board.reset();
    if (history.currentTurnIndex >= 0) {
      history.board.load(currentRoundInHistory.turns, history.currentTurnIndex);
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
