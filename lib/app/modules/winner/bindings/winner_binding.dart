import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:get/get.dart';

import '../controllers/winner_controller.dart';

class WinnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameController>(
      () => GameController(),
    );
  }
}
