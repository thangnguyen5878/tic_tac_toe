import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/custom_dialog.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/online_user_status.dart';
import 'package:get/get.dart';

class OpponentQuitGameDialog extends StatelessWidget {
  const OpponentQuitGameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('Show opponent quit game dialog.');
    return CustomDialog(
        title: "ATTENTION!",
        content: "The opponent left the match.",
        // The BACK button should behave similarly to pressing the CANCEL button.
        onBackPress: () {
          logger.t('Press back button.');
          Get.back();
          OnlineUserController.to.updateCurrentUserStatus(OnlineUserStatus.opponentQuitted);
        },
        children: [_buildQuitButton(), _buildCancelButton()]);
  }
}

TextButton _buildQuitButton() {
  return TextButton(
    onPressed: () {
      logger.t('press quit button');
      OnlineUserController.to.quitGameWhenOpponentQuitted();
    },
    child: const Text('QUIT'),
  );
}

TextButton _buildCancelButton() {
  return TextButton(
    onPressed: () {
      logger.t('press cancel button');
      Get.back();
      OnlineUserController.to.updateCurrentUserStatus(OnlineUserStatus.opponentQuitted);
    },
    child: const Text('CANCEL'),
  );
}
