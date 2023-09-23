// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:tic_tac_toe/models/board.dart';
import 'package:tic_tac_toe/models/cell.dart';
import 'package:tic_tac_toe/models/player.dart';
import 'package:tic_tac_toe/models/round.dart';
import 'package:tic_tac_toe/utils/cell_state.dart';
import 'package:tic_tac_toe/utils/game_state.dart';
import 'package:tic_tac_toe/utils/seed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable(explicitToJson: true)
class Room {
  Player player1;
  Player player2;
  late Player currentPlayer;
  Board board;
  GameState state;
  List<Round?>? rounds;
  int roundCount;
  Round currentRound;
  List<Cell>? checkingCells = [];
  final winCount = 5;

// game constructor with default values
Room({Player? player1, Player? player2})
      : player1 = player1 ?? Player('Player 1', Seed.cross, ''),
        player2 = player2 ?? Player('Player 2', Seed.nought, ''),
        board = Board(),
        roundCount = 1,
        state = GameState.playing,
        currentRound = Round(1) {
    currentPlayer = this.player1;
    rounds?.add(currentRound);
  }

  // game constructor with all parameters
  Room.all({
    required this.player1,
    required this.player2,
    required this.currentPlayer,
    required this.board,
    required this.state,
    required this.roundCount,
    this.rounds,
    required this.currentRound,
    this.checkingCells,
  });

  

  void nextTurn() {
    if (currentPlayer.seed == Seed.cross) {
      currentPlayer = player2;
      currentRound.turnCount++;
    } else {
      currentPlayer = player1;
      currentRound.turnCount++;
    }
    print('next turn, currentplayer: ${currentPlayer.name}');
  }

  bool areAllCellContentEqual(List<Cell> list) {
    if (list.isEmpty) {
      return false;
    }
    dynamic firstElement = list[0].content;
    for (int i = 1; i < list.length; i++) {
      if (list[i].content != firstElement) {
        return false;
      }
    }
    return true;
  }

  void checkWinner() {
    print('check winner...');
    // 5 seeds in a row
    for (int i = 0; i < board.rows; i++) {
      for (int j = 0; j <= board.columns - winCount; j++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i][j + k]);
        }
        if (areAllCellContentEqual(checkingCells!) &&
            board.cells[i][j].content != '') {
          // X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (currentRound.winner == null) {
              player1.score++;
            }
            currentRound.winner = player1;
            state = GameState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i][j + offset].state = CellState.crossWin;
            }
            print(
                'Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            // print(
            // 'Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            Get.toNamed('winner');
          }
          // O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (currentRound.winner == null) {
              player2.score++;
            }
            currentRound.winner = player2;
            state = GameState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i][j + offset].state = CellState.noughtWin;
            }
            print(
                'Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            Get.toNamed('winner');
          }
        }
      }
    }
    // 5 seeds in a column
    for (int j = 0; j < board.columns; j++) {
      for (int i = 0; i <= board.rows - winCount; i++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i + k][j]);
        }
        if (areAllCellContentEqual(checkingCells!) &&
            board.cells[i][j].content != '') {
          // X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (currentRound.winner == null) {
              player1.score++;
            }
            currentRound.winner = player1;
            state = GameState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j].state = CellState.crossWin;
            }
            print(
                'Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            print(
                'Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            Get.toNamed('winner');
          }
          // O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (currentRound.winner == null) {
              player2.score++;
            }
            currentRound.winner = player2;
            state = GameState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j].state = CellState.noughtWin;
            }
            print(
                'Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            Get.toNamed('winner');
          }
        }
      }
    }
    // 3 seeds in a diagonal type: \
    for (int i = 0; i <= board.rows - winCount; i++) {
      for (int j = 0; j <= board.columns - winCount; j++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i + k][j + k]);
        }
        if (areAllCellContentEqual(checkingCells!) &&
            board.cells[i][j].content != '') {
          // X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (currentRound.winner == null) {
              player1.score++;
            }
            currentRound.winner = player1;
            state = GameState.stop;
            // update cell state to change the cell color
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j + offset].state = CellState.crossWin;
            }
            print(
                'Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            // print('Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            Get.toNamed('winner');
          }
          // O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (currentRound.winner == null) {
              player2.score++;
            }
            currentRound.winner = player2;
            state = GameState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j + offset].state = CellState.noughtWin;
            }
            print(
                'Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            Get.toNamed('winner');
          }
        }
      }
    }
    // 3 seeds in a diagonal type: /
    for (int i = 0; i <= board.rows - winCount; i++) {
      for (int j = winCount - 1; j < board.columns; j++) {
        checkingCells?.clear();
        for (int k = 0; k < winCount; k++) {
          checkingCells?.add(board.cells[i + k][j - k]);
        }
        if (areAllCellContentEqual(checkingCells!) &&
            board.cells[i][j].content != '') {
          // X wins
          if (board.cells[i][j].content == Seed.cross) {
            if (currentRound.winner == null) {
              player1.score++;
            }
            currentRound.winner = player1;
            state = GameState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j - offset].state = CellState.crossWin;
            }
            print(
                'Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            // print('Win Cells: ($i, $j) ${board.cells[i][j].state}, ($i, ${j + 1}) ${board.cells[i][j].state},($i, ${j + 2}) ${board.cells[i][j].state},($i, ${j + 3}) ${board.cells[i][j].state},($i, ${j + 4}) ${board.cells[i][j].state}');
            Get.toNamed('winner');
          }
          // O wins
          if (board.cells[i][j].content == Seed.nought) {
            if (currentRound.winner == null) {
              player2.score++;
            }
            currentRound.winner = player2;
            state = GameState.stop;
            for (int offset = 0; offset < winCount; offset++) {
              board.cells[i + offset][j - offset].state = CellState.noughtWin;
            }
            print(
                'Winner is ${currentRound.winner!.name}, score: ${currentRound.winner!.score}');
            Get.toNamed('winner');
          }
        }
      }
    }
  }

  nextRound() {
    state = GameState.playing;
    board.reset();
    currentRound.winner = null;
    currentPlayer = player1;
    roundCount++;
    currentRound = Round(roundCount);
    rounds?.add(currentRound);
  }

  showWinner(Seed seed) {
    if (seed == Seed.cross) {
      currentRound.winner = player1;
      state = GameState.stop;
      print('Winner is ${currentRound.winner!.name}');
      Get.toNamed('winner');
    }
    if (seed == Seed.nought) {
      currentRound.winner = player2;
      state = GameState.stop;
      print('Winner is ${currentRound.winner!.name}');
      Get.toNamed('winner');
    }
  }

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
  Map<String, dynamic> toJson() => _$RoomToJson(this);

    Room copyWith({
    GameState? state,
    Player? player1,
    Player? player2,
    Player? currentPlayer,
    int? roundCount,
    Round? currentRound,
    List<Round>? rounds,
    Board? board,
  }) {
    return Room.all(
      state: state ?? this.state,
      player1: player1 ?? this.player1,
      player2: player2 ?? this.player2,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      roundCount: roundCount ?? this.roundCount,
      currentRound: currentRound ?? this.currentRound,
      rounds: rounds ?? this.rounds,
      board: board ?? this.board,
    );
  }

  @override
  String toString() {
    return '''Game
    State: $state,
    Player 1: $player1, 
    Player 2: $player2,
    Current player: $currentPlayer, 
    Rounds: $rounds,
    Board: $board''';
  }
}
