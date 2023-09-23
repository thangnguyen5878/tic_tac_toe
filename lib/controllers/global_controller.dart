import 'package:tic_tac_toe/models/cell.dart';
import 'package:tic_tac_toe/models/room.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/utils/game_state.dart';
import 'package:tic_tac_toe/utils/seed.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  Room room = Room();
  var roomRawData = {};

  final inputRowsController = TextEditingController();
  final inputColumnsController = TextEditingController();
  final inputPlayer1Controller = TextEditingController();
  final inputPlayer2Controller = TextEditingController();
  final inputNameController = TextEditingController();

  clearInput() {
    inputRowsController.clear();
    inputColumnsController.clear();
    inputPlayer1Controller.clear();
    inputPlayer2Controller.clear();
    inputNameController.clear();
    print('input cleared');
    update();
  }

  initGame() {
    print('init game');
    print(room);
    update();
  }

  drawSeed(int row, int column, Seed seed) {
    print('draw seed...');
    Cell cell = room.board.cells[row][column];
    if (room.state == GameState.playing &&
        (cell.content != Seed.cross && cell.content != Seed.nought)) {
      print(
          '${room.currentPlayer.name} draw seed $seed at cell($row, $column)');
      cell.content = seed;
      room.checkWinner();
      if (room.currentRound.winner == null) {
        room.nextTurn();
      }
      // print(game.board.cells);
      update();
    }
  }

  nextRound() {
    room.nextRound();
    update();
    print('next round, current round: ${room.currentRound.number}');
  }

  resetGame() {
    clearInput();
    room = Room();
    update();
    print('reset game');
  }

  updateRoomData(Map<String, dynamic> data) {
    roomRawData = data;
    room = Room.fromJson(data);
    update();
  }
}
