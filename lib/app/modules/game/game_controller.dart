import 'dart:async';

import 'package:flutter_tic_tac_toe/app/modules/create_room/create_room_controller.dart';
import 'package:flutter_tic_tac_toe/isar_service.dart';
import 'package:flutter_tic_tac_toe/models/cell.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/enums/game_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  //TODO: Implement GameController
  static GameController get to => Get.find();
  final input = Get.find<CreateRoomController>();
  bool isHistoryAutoPlay = false;
  Room room = Room();

  IsarService isarService = IsarService();

  createRoom() async {
    Room newRoom = Room();
    if (input.room.text != '') newRoom.name = input.room.text;
    if (input.player1.text != '') {
      newRoom.rounds![room.currentRoundIndex]!.players![0].name = input.player1.text;
    }
    if (input.player2.text != '') {
      newRoom.rounds![room.currentRoundIndex]!.players![1].name = input.player2.text;
    }
    if (input.rowCount.text != '') {
      newRoom.board.rowCount = int.tryParse(input.rowCount.text) ?? 10;
      newRoom.historyBoard.rowCount = int.tryParse(input.rowCount.text) ?? 10;
    }
    if (input.columnCount.text != '') {
      newRoom.board.columnCount = int.tryParse(input.columnCount.text) ?? 10;
      newRoom.historyBoard.columnCount = int.tryParse(input.columnCount.text) ?? 10;
    }
    newRoom.board.rebuild();
    newRoom.historyBoard.rebuild();
    room = newRoom;
    await isarService.saveRoom(room);
    update();
  }

  Future<int> saveRoom() async {
    await isarService.saveRoom(room);
    update();
    return room.id;
  }

  /// Load room from database to memory
  loadRoomById(id) async {
    room = (await isarService.getRoom(id))!;
    var turns = room.rounds![room.currentRoundIndex]!.turns;
    room.board.loadAll(turns);
    update();
  }

  /// The player draw a Seed in a cell(row, column) on the board.
  /// - Update the cell
  /// - Add the cell to the turns list in Round object
  /// - Scan the board to check the winner
  /// - Update the UI
  drawSeed(int row, int column, Seed seed) {
    print('draw seed...');
    // Update the cell
    Cell? cell = room.board.cells[row][column];
    print('room state: ${room.state}, cell content: ${cell.content.toString()}');
    if (room.state == GameState.playing &&
        (cell.content != Seed.cross && cell.content != Seed.nought)) {

      cell.content = seed;

      room.rounds![room.currentRoundIndex]!.turns = [...room.rounds![room.currentRoundIndex]!.turns, cell];

      room.checkWinner();

      print('Draw seed, turns: ${room.rounds![room.currentRoundIndex]!.turns}');
      update();
    }
  }

  historyNextTurn() {
    final round = room.rounds![room.currentHistoryRoundIndex];
    if (round!.historyCurrentTurnIndex! < round.turns.length) {
      round.historyNextTurn();
      room.updateHistoryBoard();
      update();
      print('History next turn: ${round.historyCurrentTurnIndex}, ${round.winTurnIndex}');
    }
  }

  historyPreviousTurn() {
    final round = room.rounds![room.currentHistoryRoundIndex]!;
    if (round.historyCurrentTurnIndex! > 0) {
      round.historyPreviousTurn();
      room.updateHistoryBoard();
      update();
      print('previos turn');
    }
  }

  pauseHistoryAutoPlay() {
    isHistoryAutoPlay = false;
    update();
  }

  void resumeHistoryAutoPlay() async {
    isHistoryAutoPlay = true;
    update();

    Timer.periodic(Duration(seconds: 1), (timer) {
      final historyCurrentRound = room.rounds![room.currentHistoryRoundIndex];
      final historyCurrentTurnIndex = historyCurrentRound!.historyCurrentTurnIndex;
      final turnCount = historyCurrentRound.turns.length;

      if (isHistoryAutoPlay) {
        historyNextTurn();
        update();

        if (historyCurrentTurnIndex! >= turnCount - 1) {
          pauseHistoryAutoPlay();
          timer.cancel();
        }
      } else {
        timer.cancel();
      }
    });
  }

  toggleHistoryAutoPlay() {
    if(isHistoryAutoPlay) {
      pauseHistoryAutoPlay();
    } else {
      resumeHistoryAutoPlay();
    }
    update();
  }

  /// Move to the next round when a player wins and the player press the `Next round button`, then update the board.
  nextRound() {
    room.nextRound();
    print('rounds: ${room.rounds}');
    update();
  }

  resetBoard() {
    room.reset();
    print('reset game');
    update();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
