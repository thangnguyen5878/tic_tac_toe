import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';

Future<void> showRejectedDialog(BuildContext context, Map<String, dynamic> opponent) {
  debugPrint('show rejected dialog');
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: Text('CHALLENGE IS THROWN!', style: kHeading2,),
      content: Text('The opponent rejected the challenge.'),
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