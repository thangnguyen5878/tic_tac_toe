import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';

Future<void> showWaitingDialog(BuildContext context, Map<String, dynamic> opponent) {
  debugPrint('show waiting dialog');
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: Text('CHALLENGE IS THROWN!', style: kHeading2,),
      content: Text('Waiting for the opponent\'s respond.'),
      actions: [
        // Cancel Button
        TextButton(
          onPressed: () => Get.back(),
          child: Text('CANCEL'),
        ),
      ],
    ),
  );
}