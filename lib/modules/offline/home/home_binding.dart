import 'package:flutter_tic_tac_toe/controllers/auth_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/create_room_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameController>(() => GameController());
    Get.lazyPut<CreateRoomController>(() => CreateRoomController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
