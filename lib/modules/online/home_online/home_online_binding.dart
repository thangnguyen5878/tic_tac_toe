import 'package:flutter_tic_tac_toe/controllers/auth_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_player_controller.dart';
import 'package:get/get.dart';

class HomeOnlineBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut(() => AuthController());
      Get.put(OnlinePlayerController());
  }
}
