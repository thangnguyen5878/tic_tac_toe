import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';

class RematchWaitingDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    logger.t('show rematch waiting dialog');

    return CustomDialog(
        title: 'REMATCH',
        content: 'Waiting for the opponent\'s respond.',
        children: [
          _buildCancelButton(),
        ]);
  }

  TextButton _buildCancelButton() {
    return TextButton(
      onPressed: () {
        logger.t('press quit button');
        OnlineUserController.to.quitGameSuddenly();
      },
      child: Text('QUIT'),
    );
  }
}
