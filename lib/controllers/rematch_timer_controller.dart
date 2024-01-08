import 'dart:async';

import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:get/get.dart';

class RematchTimerController extends GetxController {
  static RematchTimerController to = Get.find();

  Timer? _timer;
  final _rematchWaitingTime = 15; // seconds
  late int time;

  void startTimer() {
    logger.t('start rematch waiting timer');
    resetTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      logger.t('invitation waiting timer: $time');
      if (time == 0) {
        stopTimer();
        OnlineUserController.to.handleRematchTimeout();
      } else {
        time--;
      }
      update();
    },
    );
  }

  void stopTimer() {
    if (_timer != null) {
      logger.t('stop rematch waiting timer');
      _timer!.cancel();
      _timer = null;
    }
  }

  void resetTimer() {
    logger.t('reset rematch waiting timer');
    time = _rematchWaitingTime;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    super.onClose();
    stopTimer();
  }
}