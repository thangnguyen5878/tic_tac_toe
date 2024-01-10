import 'package:flutter_tic_tac_toe/controllers/create_room_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateRoomController>(() => CreateRoomController());
    Get.put(GameController());
    Get.put(HomeController());
  }
}
