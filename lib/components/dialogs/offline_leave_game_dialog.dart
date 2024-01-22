import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/custom_dialog.dart';
import 'package:flutter_tic_tac_toe/controllers/game_controller.dart';
import 'package:get/get.dart';

import '../../utils/constants/constants.dart';

class OfflineLeaveGameDialog extends StatelessWidget {
  const OfflineLeaveGameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('Show offline leave game dialog.');
    return CustomDialog(
        title: "LEAVE GAME?",
        content: "Do you really want to leave the game?",
        // The BACK button should behave similarly to pressing the CANCEL button.
        onBackPress: () {
          Get.back();
        },
        children: [_buildNoButton(), _buildYesButton()]);
  }
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
      GameController.to.handleBackFromGamePage();
    },
    child: const Text('YES'),
  );
}
