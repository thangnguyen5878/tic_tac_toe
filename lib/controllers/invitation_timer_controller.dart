import 'dart:async';

import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';
import 'package:get/get.dart';

class InvitationTimerController extends GetxController {
  static InvitationTimerController to = Get.find();

  Timer? _timer;
  final _invitationWaitingTime = 15; // seconds
  late int time;

  void startTimer() {
    logger.t('start invitation waiting timer');
    resetTimer();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        logger.t('invitation waiting timer: $time');
        if (time == 0) {
          stopTimer();
          OnlineUserController.to.handleInvitationTimeout();
        } else {
          time--;
        }
        update();
      },
    );
  }

  void stopTimer() {
    if (_timer != null) {
      logger.t('stop invitation waiting timer');
      _timer!.cancel();
      _timer = null;
    }
  }

  void resetTimer() {
    logger.t('reset invitation waiting timer');
    time = _invitationWaitingTime;
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
