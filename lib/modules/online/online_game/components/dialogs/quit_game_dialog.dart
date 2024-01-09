import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';
import 'package:get/get.dart';

class QuitGameDialog extends StatelessWidget {
  const QuitGameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('show quit game dialog');
    return CustomDialog(
        title: "ATTENTION!",
        content: "The match is not over yet\n\nAre you sure to quit the match?",
        // The BACK button should behave similarly to pressing the CANCEL button.
        onBackPress: () {
          logger.t('press back button');
          Get.back();
        },
        children: [
          _buildQuitButton(),
          _buildCancelButton()
        ]);
  }
}

TextButton _buildQuitButton() {
  return TextButton(
    onPressed: ()
    {
      logger.t('press quit button');
      OnlineUserController.to.quitGameSuddenly();
    },
    child: Text('QUIT'),
  );
}

TextButton _buildCancelButton() {
  return TextButton(
    onPressed: () {
      logger.t('press cancel button');
      Get.back();
    },
    child: Text('CANCEL'),
  );
}
