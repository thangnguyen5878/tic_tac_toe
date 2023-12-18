import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_player_controller.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';
import 'package:get/get.dart';

class InvitedDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    debugPrint('show invited dialog');
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
      OnlinePlayerController.to.rejectTheChallenge();
      Get.back();
    },
    child: Text('REJECT'),
  );
}

TextButton _buildAcceptButton() {
  return TextButton(
    onPressed: ()
    {
      OnlinePlayerController.to.acceptTheChallenge();
    },
    child: Text('ACCEPT'),
  );
}


