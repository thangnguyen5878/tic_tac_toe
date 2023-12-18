import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_player_controller.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';
import 'package:get/get.dart';

class ChallengeDialog extends StatelessWidget {
  // Map<String, dynamic> opponent;

  // ChallengeDialog({required this.opponent});

  @override
  Widget build(BuildContext context) {
    debugPrint('show challenge dialog');
    return CustomDialog(
        title: "YOU'VE BEEN CHALLENGED!",
        content: "Do you want to accept the challenge from opponent?",
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
          OnlinePlayerController.to.startChallengeAnotherPlayer();
        },
        child: Text('START'),
      );
}

TextButton _buildCancelButton() {
  return TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text('CANCEL'),
      );
}
