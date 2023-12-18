import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';
import 'package:get/get.dart';

class InviteTimeoutDialog extends StatelessWidget {
  // Map<String, dynamic> opponent;

  // InvitedDialog({required this.opponent});

  @override
  Widget build(BuildContext context) {
    debugPrint('show invite timout dialog');
    return CustomDialog(
        title: 'CHALLENGE IS THROWN!',
        content: 'Timeout expired.',
        children: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('CLOSE'),
          ),
        ]);
  }
}
