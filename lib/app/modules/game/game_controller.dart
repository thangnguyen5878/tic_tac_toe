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
  final createRoomController = Get.find<CreateRoomController>();
  bool isHistoryAutoPlay = false;
  Room room = Room();

  IsarService isarService = IsarService();

  createRoom() async {
    Room newRoom = Room();
    if (createRoomController.room.text != '') newRoom.name = createRoomController.room.text;
    if (createRoomController.player1.text != '') {
      newRoom.currentRound.player1.name = createRoomController.player1.text;
    }
    if (createRoomController.player2.text != '') {
      newRoom.currentRound.player2.name = createRoomController.player2.text;
    }
    if (createRoomController.rowCount.text != '') {
      newRoom.board.rowCount = int.tryParse(createRoomController.rowCount.text) ?? 10;
      newRoom.historyBoard.rowCount = int.tryParse(createRoomController.rowCount.text) ?? 10;
    }
    if (createRoomController.columnCount.text != '') {
      newRoom.board.columnCount = int.tryParse(createRoomController.columnCount.text) ?? 10;
      newRoom.historyBoard.columnCount = int.tryParse(createRoomController.columnCount.text) ?? 10;
    }
    newRoom.board.rebuild();
    newRoom.historyBoard.rebuild();
    room = newRoom;
    update();
  }

  /// Save current room to database and return room id
  saveRoom() async {
    await isarService.saveRoom(room);
    update();
    return room.id;
  }

  /// Load room from database to memory
  loadRoomById(id) async {
    room = (await isarService.getRoom(id))!;
    var turns = room.currentRound.turns;
    room.board.loadAll(turns);
    update();
  }

  /// The player draw a Seed in a cell(row, column) on the board.
  drawSeed(int row, int column, Seed seed) {
    print('draw seed...');
    // Update the cell
    Cell? cell = room.board.cells[row][column];
    print('room state: ${room.state}, cell content: ${cell.content.toString()}');
    if (room.state == GameState.playing && (cell.content != Seed.cross && cell.content != Seed.nought)) {
      cell.content = seed;
      room.currentRound.turns = [...room.currentRound.turns, cell];
      room.checkWinner();
      print('Draw seed, turns: ${room.currentRound.turns}');

      update();
    }
  }

  historyNextTurn() {
    final currentHistoryTurnIndex = room.historyRound.historyTurnIndex;
    final historyTurnCount = room.historyRound.turns.length;
    if (currentHistoryTurnIndex < historyTurnCount) {
      room.historyRound.historyNextTurn();
      room.updateHistoryBoard();
      update();
      print('historyNextTurn()');
    }
  }

  historyPreviousTurn() {
    final currentHistoryTurnIndex = room.historyRound.historyTurnIndex;
    if (currentHistoryTurnIndex > 0) {
      room.historyRound.historyPreviousTurn();
      room.updateHistoryBoard();
      update();
      print('historyPreviousTurn()');
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
      final historyCurrentTurnIndex = room.historyRound.historyTurnIndex;
      final turnCount = room.historyRound.turns.length;

      if (isHistoryAutoPlay) {
        historyNextTurn();
        update();

        if (historyCurrentTurnIndex >= turnCount - 1) {
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
    // print('rounds: ${room.rounds}');
    update();
  }

  resetBoard() {
    room.reset();
    print('reset game');
    update();
  }
}
