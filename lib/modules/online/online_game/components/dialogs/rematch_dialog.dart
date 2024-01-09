import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:flutter_tic_tac_toe/utils/enums/online_user_status.dart';
import 'package:flutter_tic_tac_toe/utils/widget/custom_dialog.dart';
import 'package:get/get.dart';


class RematchDialog extends StatelessWidget {
  const RematchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('show rematch dialog');

    return CustomDialog(
        title: 'REMATCH?',
        content: 'Do you want to rematch your opponent?',
        // The BACK button should behave similarly to pressing the NO button.
        onBackPress: () {
          logger.t('press back button');
          Get.back();
        },
        children: [
          _buildNoButton(),
          _buildYesButton()
        ]);
  }

  TextButton _buildNoButton() {
    return TextButton(
      onPressed: () {
        logger.t('press no button');
        Get.back();
      },
      child: Text('NO'),
    );
  }

  TextButton _buildYesButton() {
    return TextButton(
      onPressed: () {
        logger.t('press yes button');
        OnlineUserController.to.updateCurrentUserStatus(OnlineUserStatus.rematchPending);
      },
      child: Text('YES'),
    );
  }
}
