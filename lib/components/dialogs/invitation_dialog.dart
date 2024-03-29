import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/custom_dialog.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';

import '../../utils/constants/constants.dart';

class InvitationDialog extends StatelessWidget {
  const InvitationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('show invited dialog');
    return CustomDialog(
        title: "YOU'VE BEEN CHALLENGED!",
        content:
            "Do you want to accept the challenge from ${OnlineUserController.to.opponent?.email ?? ''}?",
        // The BACK button should behave similarly to pressing the REJECT button.
        onBackPress: () {
          logger.t('press back button');
          OnlineUserController.to.rejectInvitation();
        },
        children: [_buildRejectButton(), _buildAcceptButton()]);
  }
}

TextButton _buildRejectButton() {
  return TextButton(
    onPressed: () {
      logger.t('press reject button');
      OnlineUserController.to.rejectInvitation();
    },
    child: const Text('REJECT'),
  );
}

TextButton _buildAcceptButton() {
  return TextButton(
    onPressed: () {
      logger.t('press accept button');
      OnlineUserController.to.acceptChallengeFromOpponent();
    },
    child: const Text('ACCEPT'),
  );
}
