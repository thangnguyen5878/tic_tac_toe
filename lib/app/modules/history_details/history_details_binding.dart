import 'package:flutter_tic_tac_toe/app/modules/game/game_controller.dart';
import 'package:get/get.dart';


class HistoryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameController>(
      () => GameController(),
    );
  }
}
