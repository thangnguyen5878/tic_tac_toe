import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';

Future<void> showInviteTimeoutDialog(BuildContext context, Map<String, dynamic> opponent) {
  debugPrint('show invite timeout dialog');
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: Text('CHALLENGE IS THROWN!', style: kHeading2,),
      content: Text('Timeout expired.'),
      actions: [
        // Close Button
        TextButton(
          onPressed: () => Get.back(),
          child: Text('CLOSE'),
        ),
      ],
    ),
  );
}