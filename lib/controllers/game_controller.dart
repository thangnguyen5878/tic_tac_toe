import 'dart:async';

import 'package:flutter_tic_tac_toe/controllers/create_room_controller.dart';
import 'package:flutter_tic_tac_toe/models/offline/cell.dart';
import 'package:flutter_tic_tac_toe/models/offline/room.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/services/isar_service.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/game_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  static GameController get to => Get.find();
  bool isHistoryAutoPlay = false;
  Room room = Room();

  IsarService isarService = IsarService();
  late List<Room> rooms;

  createRoom() async {
    Room newRoom = Room();
    if (CreateRoomController.to.room.text != '') {
      newRoom.name = CreateRoomController.to.room.text;
    }
    if (CreateRoomController.to.player1.text != '') {
      newRoom.getCurrentRound().players![0].name = CreateRoomController.to.player1.text;
    }
    if (CreateRoomController.to.player2.text != '') {
      newRoom.getCurrentRound().players![1].name = CreateRoomController.to.player2.text;
    }
    if (CreateRoomController.to.rowCount.text != '') {
      newRoom.board.rowCount = int.tryParse(CreateRoomController.to.rowCount.text) ?? 10;
      newRoom.historyBoard.rowCount = int.tryParse(CreateRoomController.to.rowCount.text) ?? 10;
    }
    if (CreateRoomController.to.columnCount.text != '') {
      newRoom.board.columnCount = int.tryParse(CreateRoomController.to.columnCount.text) ?? 10;
      newRoom.historyBoard.columnCount =
          int.tryParse(CreateRoomController.to.columnCount.text) ?? 10;
    }
    newRoom.board.rebuild();
    newRoom.historyBoard.rebuild();
    room = newRoom;
    await isarService.saveRoom(room);
    update();
  }

  Future<int> saveRoomToIsarDatabase() async {
    await isarService.saveRoom(room);
    update();
    return room.id;
  }

  /// Load a room from isar database by room id.
  loadRoomById(id) async {
    room = (await isarService.getRoom(id))!;
    var turns = room.getCurrentRound().turns;
    room.board.loadAll(turns);
    update();
  }

  /// The player draw a Seed in a cell(row, column) on the board.
  drawSeed(int row, int column, Seed seed) {
    logger.t('draw seed...');
    // Update the cell
    Cell? cell = room.board.cells[row][column];
    logger.t('room state: ${room.state}, cell content: ${cell.content.toString()}');
    if (room.state == GameState.playing &&
        (cell.content != Seed.cross && cell.content != Seed.nought)) {
      cell.content = seed;
      room.getCurrentRound().turns = [...room.getCurrentRound().turns, cell];
      room.checkWinner();
      logger.t('Draw seed, turns: ${room.getCurrentRound().turns}');
      GameController.to.saveRoomToIsarDatabase();
      update();
    }
  }

  historyNextTurn() {
    final currentHistoryTurnIndex = room.getHistoryRound().historyTurnIndex!;
    final historyTurnCount = room.getHistoryRound().turns.length;
    if (currentHistoryTurnIndex < historyTurnCount) {
      room.getHistoryRound().historyNextTurn();
      room.updateHistoryBoard();
      update();
      logger.t('historyNextTurn()');
    }
  }

  historyPreviousTurn() {
    final currentHistoryTurnIndex = room.getHistoryRound().historyTurnIndex;
    if (currentHistoryTurnIndex! > 0) {
      room.getHistoryRound().historyPreviousTurn();
      room.updateHistoryBoard();
      update();
      logger.t('historyPreviousTurn()');
    }
  }

  pauseHistoryAutoPlay() {
    isHistoryAutoPlay = false;
    update();
  }

  void resumeHistoryAutoPlay() async {
    isHistoryAutoPlay = true;
    update();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      final historyCurrentTurnIndex = room.getHistoryRound().historyTurnIndex;
      final turnCount = room.getHistoryRound().turns.length;

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
    if (isHistoryAutoPlay) {
      pauseHistoryAutoPlay();
    } else {
      resumeHistoryAutoPlay();
    }
    update();
  }

  /// Move to the next round when a player wins and the player press the `Next round button`, then update the board.
  nextRound() {
    room.nextRound();
    // logger.t('rounds: ${room.rounds}');
    update();
  }

  resetBoard() {
    room.reset();
    logger.t('reset game');
    update();
  }

  void handleBackFromGamePage() {
    GameController.to.saveRoomToIsarDatabase();
    Get.offAllNamed(Routes.HOME);
  }
}
