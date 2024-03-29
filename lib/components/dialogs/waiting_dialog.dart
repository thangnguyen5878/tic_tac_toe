import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/custom_dialog.dart';
import 'package:flutter_tic_tac_toe/controllers/invitation_timer_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';
import 'package:get/get.dart';

class WaitingDialog extends StatelessWidget {
  const WaitingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => InvitationTimerController());
    logger.t('show waiting dialog');
    return GetBuilder<InvitationTimerController>(
      assignId: true,
      builder: (controller) {
        return CustomDialog(
            title: 'CHALLENGE IS THROWN!',
            content: 'Waiting for the opponent\'s respond.\n${controller.time}s',
            // The BACK button should behave similarly to pressing the CANCEL button.
            onBackPress: () {
              logger.t('press back button');
              OnlineUserController.to.cancelInvitationWaiting();
            },
            children: [
              _buildCancelButton(),
            ]);
      },
    );
  }

  TextButton _buildCancelButton() {
    return TextButton(
      onPressed: () {
        logger.t('press cancel button');
        OnlineUserController.to.cancelInvitationWaiting();
      },
      child: const Text('CANCEL'),
    );
  }
}
