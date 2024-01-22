import 'dart:async';

import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/models/board.dart';
import 'package:flutter_tic_tac_toe/models/cell.dart';
import 'package:flutter_tic_tac_toe/models/player.dart';
import 'package:flutter_tic_tac_toe/models/room.dart';
import 'package:flutter_tic_tac_toe/models/round.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/game_state.dart';
import 'package:flutter_tic_tac_toe/utils/enums/online_user_status.dart';
import 'package:flutter_tic_tac_toe/utils/enums/seed.dart';
import 'package:get/get.dart';

class OnlineGameController extends GetxController {
  static OnlineGameController to = Get.find();

  bool isHistoryAutoPlay = false;
  String currentRoomId = '';

  Room room = Room();
  // StreamController<OnlineRoom> _roomController = StreamController<OnlineRoom>();

  Player player = Player();
  Board board = Board();
  Cell cell = Cell();
  Round round = Round();

  @override
  void onReady() {
    super.onReady();
    _watchRoomFromFirebase();
  }

  void updateRoom(Map<String, dynamic> json) {
    room = Room.fromJson(json);
    update();
  }

  void _watchRoomFromFirebase() {
    // listen for current user
    if (currentRoomId != '') {
      firestoreService.watchRoom(currentRoomId).listen((snapshot) {
        if (snapshot.exists) {
          room = snapshot.data() as Room;
          logger.t('update room instance from firebase');
          logger.t('Room{id: ${room.id}, name: ${room.name}');
        }
        update();
      });
    }
  }

  void createRoom(String player1Id, String player2Id) {
    room = Room.custom(playerIds: [player1Id, player2Id]);
    currentRoomId = room.id;
    logger.t('room created in controller');
    logger.i(room.toShortString());
    update();
  }

  void pullRoomFromFirebase() {
    firestoreService.getRoom(currentRoomId).then((snapshot) {
      room = snapshot.data()! as Room;
      logger.t('pull room from firebase');
      logger.t('Room{id: ${room.id}, name: ${room.name}');
    });
    update();
  }

  Future<void> pushRoomToFirebase() async {
    await firestoreService.addRoom(room);
    logger.t('Room{id: ${room.id}, name: ${room.name}}');
    update();
  }

  void pushRoomToFirebaseWithArgument(Room onlineRoom) {
    firestoreService.addRoom(onlineRoom);
    logger.t('push onlineRoom to firebase');
    logger.t('Room{id: ${onlineRoom.id}, name: ${onlineRoom.name}}');
    update();
  }

  createPlayer() {
    firestoreService.addPlayer(player);
    Map<String, dynamic> json = player.toJson();
    logger.t(json as String);
    update();
  }

  createCell() {
    firestoreService.addCell(cell);
    Map<String, dynamic> json = cell.toJson();
    logger.t(json as String);
    update();
  }

  createBoard() {
    firestoreService.addBoard(board);
    Map<String, dynamic> json = board.toJson();
    logger.t(json as String);
    update();
  }

  createRound() {
    firestoreService.addRound(round);
    Map<String, dynamic> json = round.toJson();
    logger.t(json as String);
    update();
  }

  /// The player draw a Seed in a cell(row, column) on the board.
  drawSeedOnCell(int row, int column, Seed seed) {
    logger.t('draw $seed on cell($row, $column)');
    Cell? cell = room.board.cells[row][column];
    if (room.state == GameState.playing &&
        (cell.content != Seed.cross && cell.content != Seed.nought)) {
      cell.content = seed;
      room.getCurrentRound().turns = [...room.getCurrentRound().turns, cell];
      room.checkWinner();
      OnlineGameController.to.pushRoomToFirebase();
      update();
    }
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

  /// Move to the next round when a player wins and the player press the `Next round button`, then update the board.
  Future<void> nextRound() async {
    room.nextRound();
    await pushRoomToFirebase();
    final data = {'status': OnlineUserStatus.inGame.toShortString()};
    OnlineUserController.to.updateTwoUserOnFirebase(data);
    update();
  }

  resetBoard() async {
    room.reset();
    await pushRoomToFirebase();
    update();
  }
}
