import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(OnlineUserController());
    Get.put(OnlineGameController());
  }
}
