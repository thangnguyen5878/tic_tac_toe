import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:get/get.dart';

class WinnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameController>(
      () => GameController(),
    );
  }
}
