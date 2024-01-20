import 'dart:async';

import 'package:flutter_tic_tac_toe/controllers/create_room_controller.dart';
import 'package:flutter_tic_tac_toe/models/cell.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
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
      newRoom.getPlayer1().name = CreateRoomController.to.player1.text;
    }
    if (CreateRoomController.to.player2.text != '') {
      newRoom.getPlayer2().name = CreateRoomController.to.player2.text;
    }
    if (CreateRoomController.to.rowCount.text != '') {
      newRoom.board.rowCount = int.tryParse(CreateRoomController.to.rowCount.text) ?? 10;
      newRoom.history.board.rowCount = int.tryParse(CreateRoomController.to.rowCount.text) ?? 10;
    }
    if (CreateRoomController.to.columnCount.text != '') {
      newRoom.board.columnCount = int.tryParse(CreateRoomController.to.columnCount.text) ?? 10;
      newRoom.history.board.columnCount =
          int.tryParse(CreateRoomController.to.columnCount.text) ?? 10;
    }
    newRoom.board.rebuild();
    // newRoom.historyBoard.rebuild();
    room = newRoom;
    await isarService.saveRoom(room);
    update();
  }

  void viewHistoryRoundDetails(int roundIndex) {
    GameController.to.room.history.currentRoundIndex = roundIndex;
    Get.toNamed(Routes.HISTORY_DETAILS, arguments: [room.isarId, roundIndex]);
    update();
  }

  Future<int> saveRoomToIsarDatabase() async {
    await isarService.saveRoom(room);
    // update();
    return room.isarId;
  }

  /// Load a room from isar database by room id.
  Future<void> loadRoomById(id) async {
    room = (await isarService.getRoom(id))!;
    room.lastAccessAt = DateTime.now();
    var turns = room.getCurrentRound().turns;
    room.board.loadAll(turns);
    update();
  }

  void openRoom(int roomId) {
    logger.t('open a room(id: ${roomId})');
    loadRoomById(roomId);
    Get.toNamed(Routes.GAME, arguments: roomId);
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

  /// Move to the next round when a player wins and the player press the `Next round button`, then update the board.
  void nextRound() {
    room.nextRound();
    // logger.t('rounds: ${room.rounds}');
    update();
  }

  void resetBoard() {
    room.reset();
    logger.t('reset game');
    update();
  }

  void handleBackFromGamePage() {
    GameController.to.saveRoomToIsarDatabase();
    Get.offAllNamed(Routes.HOME);
  }

  // HISTORY METHODS
  void goToNextTurnInHistory() {
    if (!room.isLastTurnInHistory()) {
      logger.t('History: Go to next turn');
      room.history.goToNextTurn();
      room.updateBoardInHistory();
      update();
    } else {
      if (isHistoryAutoPlay) {
        pauseHistoryAutoPlay();
      }
    }
  }

  void goToPreviousTurnInHistory() {
    if (!room.history.isFirstTurn()) {
      logger.t('History: Go to previous turn');
      room.history.goToPreviousTurn();
      room.updateBoardInHistory();
      update();
    }
  }

  void pauseHistoryAutoPlay() {
    isHistoryAutoPlay = false;
    update();
  }

  void resumeHistoryAutoPlay() async {
    isHistoryAutoPlay = true;
    update();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isHistoryAutoPlay) {
        goToNextTurnInHistory();
        update();
      } else {
        timer.cancel();
      }
    });
  }

  void toggleHistoryAutoPlay() {
    if (isHistoryAutoPlay) {
      pauseHistoryAutoPlay();
    } else {
      resumeHistoryAutoPlay();
    }
    update();
  }
}
