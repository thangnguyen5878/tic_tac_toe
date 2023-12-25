import 'package:flutter_tic_tac_toe/models/online/online_board.dart';
import 'package:flutter_tic_tac_toe/models/online/online_cell.dart';
import 'package:flutter_tic_tac_toe/models/online/online_player.dart';
import 'package:flutter_tic_tac_toe/models/online/online_room.dart';
import 'package:flutter_tic_tac_toe/models/online/online_round.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:get/get.dart';

class OnlineGameController extends GetxController {
  static OnlineGameController to = Get.find();
  OnlineRoom room = OnlineRoom();
  OnlinePlayer player = OnlinePlayer();
  OnlineBoard board = OnlineBoard();
  OnlineCell cell = OnlineCell();
  OnlineRound round = OnlineRound();

  createRoom() {
    firestoreService.addRoom(room);
    Map<String, dynamic> json = room.toJson();
    print(json);
    update();
  }

  createPlayer() {
    firestoreService.addPlayer(player);
    Map<String, dynamic> json = player.toJson();
    print(json);
    update();
  }

  createCell() {
    firestoreService.addCell(cell);
    Map<String, dynamic> json = cell.toJson();
    print(json);
    update();
  }

  createBoard() {
    firestoreService.addBoard(board);
    Map<String, dynamic> json = board.toJson();
    print(json);
    update();
  }

  createRound() {
    firestoreService.addRound(round);
    Map<String, dynamic> json = round.toJson();
    print(json);
    update();
  }
}
