import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tic_tac_toe/controllers/global_controller.dart';
import 'package:tic_tac_toe/screens/test_screen.dart';

class SocketClient {
  SocketClient._internal() {
    print('client connect to server...');
    socket = IO.io('http://192.168.1.109:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });
    socket!.connect();
  }

  IO.Socket? socket;

  static SocketClient? _instance;

  static SocketClient get instance {
    print(_instance);
    _instance = SocketClient._internal();
    return _instance!;
  }

  // EMITS
  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      print('emit create room event...');
      instance.socket!.emit('createRoom', {
        'nickname': nickname,
      });
    }
  }

  // void joinRoom(String nickname, String roomId) {
  //   if (nickname.isNotEmpty && roomId.isNotEmpty) {
  //     _socketClient.emit('joinRoom', {
  //       'nickname': nickname,
  //       'roomId': roomId,
  //     });
  //   }
  // }

  // void tapGrid(int index, String roomId, List<String> displayElements) {
  //   if (displayElements[index] == '') {
  //     _socketClient.emit('tap', {
  //       'index': index,
  //       'roomId': roomId,
  //     });
  //   }
  // }

  // LISTENERS
  createRoomSuccessListener() {
    instance.socket!.on('createRoomSuccess', (room) {
      GlobalController.to.updateRoomData(room);
      Get.to(TestScreen());
    });
  }

  // void joinRoomSuccessListener(BuildContext context) {
  //   _socketClient.on('joinRoomSuccess', (room) {
  //     Provider.of<RoomDataProvider>(context, listen: false)
  //         .updateRoomData(room);
  //     Navigator.pushNamed(context, GameScreen.routeName);
  //   });
  // }

  // void errorOccuredListener(BuildContext context) {
  //   _socketClient.on('errorOccurred', (data) {
  //     showSnackBar(context, data);
  //   });
  // }

  // void updatePlayersStateListener(BuildContext context) {
  //   _socketClient.on('updatePlayers', (playerData) {
  //     Provider.of<RoomDataProvider>(context, listen: false).updatePlayer1(
  //       playerData[0],
  //     );
  //     Provider.of<RoomDataProvider>(context, listen: false).updatePlayer2(
  //       playerData[1],
  //     );
  //   });
  // }

  // void updateRoomListener(BuildContext context) {
  //   _socketClient.on('updateRoom', (data) {
  //     Provider.of<RoomDataProvider>(context, listen: false)
  //         .updateRoomData(data);
  //   });
  // }

  // void tappedListener(BuildContext context) {
  //   _socketClient.on('tapped', (data) {
  //     RoomDataProvider roomDataProvider =
  //         Provider.of<RoomDataProvider>(context, listen: false);
  //     roomDataProvider.updateDisplayElements(
  //       data['index'],
  //       data['choice'],
  //     );
  //     roomDataProvider.updateRoomData(data['room']);
  //     // check winnner
  //     GameMethods().checkWinner(context, _socketClient);
  //   });
  // }

  // void pointIncreaseListener(BuildContext context) {
  //   _socketClient.on('pointIncrease', (playerData) {
  //     var roomDataProvider =
  //         Provider.of<RoomDataProvider>(context, listen: false);
  //     if (playerData['socketID'] == roomDataProvider.player1.socketID) {
  //       roomDataProvider.updatePlayer1(playerData);
  //     } else {
  //       roomDataProvider.updatePlayer2(playerData);
  //     }
  //   });
  // }

  // void endGameListener(BuildContext context) {
  //   _socketClient.on('endGame', (playerData) {
  //     showGameDialog(context, '${playerData['nickname']} won the game!');
  //     Navigator.popUntil(context, (route) => false);
  //   });
  // }
}
