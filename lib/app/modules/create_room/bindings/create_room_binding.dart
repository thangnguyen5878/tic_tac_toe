import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:get/get.dart';

import '../controllers/create_room_controller.dart';

class CreateRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateRoomController>(
      () => CreateRoomController(),
    );
    Get.lazyPut<GameController>(
      () => GameController(),
    );
  }
}
