import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/enums/online_user_status.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';
import 'package:get/get.dart';

class OpponentQuitGameDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    debugPrint('show opponent quit game dialog');
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
      OnlineUserController.to.quitGameWhenOpponentQuited();
    },
    child: Text('QUIT'),
  );
}

TextButton _buildCancelButton() {
  return TextButton(
    onPressed: () {
      Get.back();
      OnlineUserController.to.updateCurrentUserStatus(OnlineUserStatus.opponentQuitted.toShortString());
    },
    child: Text('CANCEL'),
  );
}
