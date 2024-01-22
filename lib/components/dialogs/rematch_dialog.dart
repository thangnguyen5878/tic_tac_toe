import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/custom_dialog.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';
import 'package:get/get.dart';

class RematchDialog extends StatelessWidget {
  const RematchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('Show rematch dialog.');

    return CustomDialog(
        title: 'REMATCH?',
        content: 'Do you want to rematch your opponent?',
        // The BACK button should behave similarly to pressing the NO button.
        onBackPress: () {
          logger.t('Press back button.');
          Get.back();
        },
        children: [_buildNoButton(), _buildYesButton()]);
  }

  TextButton _buildNoButton() {
    return TextButton(
      onPressed: () {
        logger.t('Press NO button.');
        Get.back();
      },
      child: const Text('NO'),
    );
  }

  TextButton _buildYesButton() {
    return TextButton(
      onPressed: () {
        logger.t('Press YES button.');
        OnlineUserController.to.handlePressRematchButtonOnDialog();
      },
      child: const Text('YES'),
    );
  }
}
