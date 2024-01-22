import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/custom_dialog.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:get/get.dart';

class InvitationTimeoutDialog extends StatelessWidget {
  const InvitationTimeoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('show invitation timout dialog');
    return CustomDialog(
        title: 'INVITATION TIME OUT',
        content: 'Timeout expired.',
        // The BACK button should behave similarly to pressing the CLOSE button.
        onBackPress: () {
          logger.t('press back button');
          Get.back();
        },
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
      child: const Text('CLOSE'),
    );
  }
}
