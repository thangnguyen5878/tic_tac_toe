import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';
import 'package:get/get.dart';

class RejectedDialog extends StatelessWidget {
  const RejectedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('show rejected dialog');
    return CustomDialog(
        title: 'CHALLENGE REJECTED!',
        content: 'The opponent rejected the challenge.',
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
