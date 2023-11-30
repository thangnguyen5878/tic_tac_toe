import 'package:flutter_tic_tac_toe/app/modules/auth/auth_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/create_room/create_room_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameController>(() => GameController());
    Get.lazyPut<CreateRoomController>(() => CreateRoomController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
