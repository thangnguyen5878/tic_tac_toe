import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';

class InvitationDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    logger.t('show invited dialog');
    return CustomDialog(
        title: "YOU'VE BEEN CHALLENGED!",
        content: "Do you want to accept the challenge from ${OnlineUserController.to.opponent?.email ?? ''}?",
        children: [
          _buildRejectButton(),
          _buildAcceptButton()
        ]);
  }
}

TextButton _buildRejectButton() {
  return TextButton(
    onPressed: () {
      logger.t('press reject button');
      OnlineUserController.to.rejectInvitation();
    },
    child: Text('REJECT'),
  );
}

TextButton _buildAcceptButton() {
  return TextButton(
    onPressed: ()
    {
      logger.t('press accept button');
      OnlineUserController.to.acceptChallengeFromOpponent();
    },
    child: Text('ACCEPT'),
  );
}


