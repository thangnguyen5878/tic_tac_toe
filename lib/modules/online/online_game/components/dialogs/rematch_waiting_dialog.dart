import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/invitation_timer_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/rematch_timer_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';
import 'package:get/get.dart';

class RematchWaitingDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RematchTimerController());
    logger.t('show rematch waiting dialog');
    return GetBuilder<RematchTimerController>(
      assignId: true,
      builder: (controller) {
        return CustomDialog(
            title: 'REMATCH',
            content: 'Waiting for the opponent\'s respond.\n${controller.time}s',
            children: [
              // Cancel Button
              TextButton(
                onPressed: () {
                  logger.t('press quit button');
                  OnlineUserController.to.quitGameSuddenly();
                },
                child: Text('QUIT'),
              ),
            ]);
      },
    );
  }
}
