import 'package:flutter_tic_tac_toe/app/modules/create_room/create_room_controller.dart';
import 'package:flutter_tic_tac_toe/isar_service.dart';
import 'package:flutter_tic_tac_toe/models/cell.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/utils/game_state.dart';
import 'package:flutter_tic_tac_toe/utils/seed.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class GameController extends GetxController {
  //TODO: Implement GameController
  static GameController get to => Get.find();
  final input = Get.find<CreateRoomController>();
  Room room = Room();

  IsarService isarService = IsarService();

  createRoom() async {
    Room newRoom = Room();
    if (input.room.text != '') newRoom.name = input.room.text;
    if (input.player1.text != '') newRoom.currentRound.players![0].name = input.player1.text;
    if (input.player2.text != '') newRoom.currentRound.players![1].name = input.player2.text;
    if (input.rowCount.text != '')
      newRoom.board!.rowCount = int.tryParse(input.rowCount.text) ?? 10;
    if (input.columnCount.text != '')
      newRoom.board!.columnCount = int.tryParse(input.columnCount.text) ?? 10;
    newRoom.board!.rebuild();
    room = newRoom;
    await isarService.saveRoom(room);
    update();
  }

  saveRoom() async {
    await isarService.saveRoom(room);
    update();
  }

  loadRoomById(id) async {
    room = (await isarService.getRoom(id))!;
    var turns = room.currentRound.turns;
    room.board.load(turns);
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
    print(
        'room state: ${room.state}, cell content: ${cell.content.toString()}');
    if (room.state == GameState.playing &&
        (cell.content != Seed.cross && cell.content != Seed.nought)) {
      print(
          '${room.currentRound.currentPlayer!.name} draw seed $seed at cell($row, $column)');
      cell.content = seed;

      room.currentRound.turns = [...room.currentRound.turns, cell];

      room.checkWinner();

      // print(game.board.cells);
      update();
    }
  }

  /// Move to the next round when a player wins and the player press the `Next round button`, then update the board.
  nextRound() {
    room.nextRound();
    print('next round, current round: ${room.currentRound.number}');
    update();
  }

  resetBoard() {
    room.reset();
    print('reset game');
    update();
  }

//   updateRoomData(Map<String, dynamic> data) {
//     roomRawData = data;
//     update();
//   }
// }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  //   @override
  //   void onClose() {
  //     super.onClose();
  //   }
}
