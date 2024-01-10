import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:get/get.dart';

class OnlineWaitingRoomBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => AuthController());
    Get.lazyPut(() => OnlineUserController());
    Get.put(OnlineGameController());
  }
}
