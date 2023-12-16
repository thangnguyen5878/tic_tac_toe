import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/show_waiting_dialog.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';

Future<void> showChallengleDialog(BuildContext context, Map<String, dynamic> opponent) {
  debugPrint('show challenge dialog');
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text('CHALLENGE THE PLAYER', style: kHeading2,),
      content: Text(opponent['email']),
      actions: [
        _buildCancelButton(context),
        _buildStartButton(context, opponent),
      ],
    ),
  );
}

TextButton _buildStartButton(BuildContext context, Map<String, dynamic> player) {
  return TextButton(
        onPressed: ()
        {
          Get.back();
          showWaitingDialog(context, player);
        },
        child: Text('START'),
      );
}

TextButton _buildCancelButton(BuildContext context) {
  return TextButton(
        onPressed: () => Get.back(),
        child: Text('CANCEL'),
      );
}
