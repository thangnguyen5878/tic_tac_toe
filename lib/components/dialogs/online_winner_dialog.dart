import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/custom_dialog.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/enums/online_user_status.dart';
import 'package:get/get.dart';

import '../../utils/constants/constants.dart';

class OnlineWinnerDialog extends StatelessWidget {
  const OnlineWinnerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('Show online winner dialog.');
    return CustomDialog(
        title: "YOU WIN!",
        content: "Congratulation! You win this round.",
        hasCloseIconButton: true,
        // The BACK button should behave similarly to pressing the CLOSE button.
        onBackPress: () {
          Get.back();
          OnlineUserController.to.updateCurrentUserStatus(OnlineUserStatus.roundCompleted);
        },
        children: [_buildQuitButton(), _buildRematchButton()]);
  }
}

TextButton _buildQuitButton() {
  return TextButton(
    onPressed: () {
      OnlineUserController.to.quitGameSuddenly();
    },
    child: const Text('QUIT'),
  );
}

TextButton _buildRematchButton() {
  return TextButton(
    onPressed: () {
      logger.t('press rematch button');
      OnlineUserController.to.handlePressRematchButtonOnDialog();
    },
    child: const Text('REMATCH'),
  );
}
