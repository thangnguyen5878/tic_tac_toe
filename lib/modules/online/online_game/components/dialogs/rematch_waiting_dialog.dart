import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/online_user_status.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';
import 'package:get/get.dart';

class RematchWaitingDialog extends StatelessWidget {
  const RematchWaitingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('Show rematch waiting dialog.');

    return CustomDialog(
        title: 'REMATCH',
        content: 'Waiting for the opponent\'s respond.',
        // The BACK button should behave similarly to pressing the CANCEL button.
        onBackPress: () {
          logger.t('Press back button.');
          Get.back();
          OnlineUserController.to.updateCurrentUserStatus(OnlineUserStatus.roundCompleted);
        },
        children: [
          _buildCancelButton(),
        ]);
  }

  TextButton _buildCancelButton() {
    return TextButton(
      onPressed: () {
        logger.t('Press cancel button.');
        OnlineUserController.to.handleRematchWaitingCancelation();
      },
      child: const Text('CANCEL'),
    );
  }
}
