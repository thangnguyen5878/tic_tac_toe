import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';
import 'package:get/get.dart';

class RejectedDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    logger.t('show rejected dialog');
    return CustomDialog(
        title: 'CHALLENGE REJECTED!',
        content: 'The opponent rejected the challenge.',
        children: [
          // Close Button
          TextButton(
            onPressed: () {
              logger.t('press close button');
              Get.back();
            },
            child: Text('CLOSE'),
          ),
        ]);
  }
}
