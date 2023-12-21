import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';
import 'package:get/get.dart';

class QuitGameDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    debugPrint('show quit game dialog');
    return CustomDialog(
        title: "ATTENTION!",
        content: "The match is not over yet\n\nAre you sure to quit the match?",
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
      OnlineUserController.to.quitGameSuddenly();
    },
    child: Text('QUIT'),
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