import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';

class OnlineWinnerDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    logger.t('show online winner dialog');
    return CustomDialog(
        title: "YOU WIN!",
        content: "Congratulation! You win this round.",
        hasCloseIconButton: true,
        onClose: () {

        },
        children: [_buildQuitButton(), _buildRematchButton()]);
  }
}

TextButton _buildQuitButton() {
  return TextButton(
    onPressed: () {
      OnlineUserController.to.quitGameSuddenly();
    },
    child: Text('QUIT'),
  );
}

TextButton _buildRematchButton() {
  return TextButton(
    onPressed: ()
    {
      logger.t('press rematch button');
      // OnlineUserController.to.acceptChallengeFromOpponent();
    },
    child: Text('REMATCH'),
  );
}


