import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';
import 'package:get/get.dart';

class ChallengeDialog extends StatelessWidget {
  const ChallengeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('show challenge dialog');
    return CustomDialog(
        title: "CHALLENGE ANOTHER PLAYER",
        content: "Do you want to challenge ${OnlineUserController.to.opponent?.email ?? ''}",
        // The BACK button should behave similarly to pressing the CANCEL button.
        onBackPress: () {
          logger.t('press back button');
          Get.back();
        },
        children: [
          _buildCancelButton(),
          _buildStartButton()
        ]);
  }
}

TextButton _buildStartButton() {
  return TextButton(
        onPressed: ()
        {
          logger.t('press start button');
          OnlineUserController.to.challengeAnotherUser();
        },
        child: Text('START'),
      );
}

TextButton _buildCancelButton() {
  return TextButton(
        onPressed: () {
          logger.t('press back button');
          Get.back();
        },
        child: Text('CANCEL'),
      );
}
