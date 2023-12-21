import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';

class WaitingDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    debugPrint('show waiting dialog');
    return CustomDialog(
        title: 'CHALLENGE IS THROWN!',
        content: 'Waiting for the opponent\'s respond.',
        children: [
          // Cancel Button
          TextButton(
            onPressed: () {
              OnlineUserController.to.cancelWaiting();
            },
            child: Text('CANCEL'),
          ),
        ]);
  }
}
