import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';

Future<void> showInvitedDialog(BuildContext context, Map<String, dynamic> opponent) {
  debugPrint('show invited dialog');
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text('YOU\'VE BEEN CHALLENGE', style: kHeading2,),
      content: Text(opponent['email']),
      actions: [
        _buildRejectButton(context),
        _buildAcceptButton(context, opponent),
      ],
    ),
  );
}

TextButton _buildRejectButton(BuildContext context) {
  return TextButton(
    onPressed: () => Get.back(),
    child: Text('REJECT'),
  );
}

TextButton _buildAcceptButton(BuildContext context, Map<String, dynamic> player) {
  return TextButton(
    onPressed: ()
    {
      Get.offNamed(Routes.ONLINE_GAME);
    },
    child: Text('ACCEPT'),
  );
}


