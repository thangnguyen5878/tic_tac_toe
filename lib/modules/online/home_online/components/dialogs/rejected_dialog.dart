import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';
import 'package:get/get.dart';

class RejectedDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    debugPrint('show rejected dialog');
    return CustomDialog(
        title: 'CHALLENGE IS THROWN!',
        content: 'The opponent rejected the challenge.',
        children: [
          // Close Button
          TextButton(
            onPressed: () => Get.back(),
            child: Text('CLOSE'),
          ),
        ]);
  }
}
