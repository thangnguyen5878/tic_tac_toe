import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/online_user_status.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';
import 'package:get/get.dart';

class OpponentQuitGameDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    logger.t('show opponent quit game dialog');
    return CustomDialog(
        title: "VICTORY!",
        content: "The opponent left the match.",
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
      OnlineUserController.to.quitGameWhenOpponentQuited();
    },
    child: Text('QUIT'),
  );
}

TextButton _buildCancelButton() {
  return TextButton(
    onPressed: () {
      logger.t('press cancel button');
      Get.back();
      OnlineUserController.to.updateCurrentUserStatus(OnlineUserStatus.opponentQuitted);
    },
    child: Text('CANCEL'),
  );
}
