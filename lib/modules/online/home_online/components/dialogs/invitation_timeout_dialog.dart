import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';
import 'package:get/get.dart';

class InvitationTimeoutDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    logger.t('show invitation timout dialog');
    return CustomDialog(
        title: 'INVITATION TIME OUT',
        content: 'Timeout expired.',
        children: [
          _buildCloseButton(),
        ]);
  }

  TextButton _buildCloseButton() {
    return TextButton(
      onPressed: () {
        logger.t('press close button');
        Get.back();
      },
      child: Text('CLOSE'),
    );
  }
}
