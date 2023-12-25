import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_game_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';

class InvitedDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('show invited dialog');
    return CustomDialog(
        title: "YOU'VE BEEN CHALLENGED!",
        content: "Do you want to accept the challenge from opponent?",
        children: [
          _buildRejectButton(),
          _buildAcceptButton()
        ]);
  }
}

TextButton _buildRejectButton() {
  return TextButton(
    onPressed: () {
      OnlineUserController.to.rejectInvitation();
    },
    child: Text('REJECT'),
  );
}

TextButton _buildAcceptButton() {
  return TextButton(
    onPressed: ()
    {
      OnlineUserController.to.acceptChallenge();
      OnlineGameController.to.createRoom();
    },
    child: Text('ACCEPT'),
  );
}


