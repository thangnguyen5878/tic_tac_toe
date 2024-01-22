import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../../utils/constants/constants.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: Get.width * 0.8, minHeight: 48),
      child: TextButton(
        onPressed: () {
          logger.t('press sign out button');
          AuthController.to.signOut();
        },
        style: TextButton.styleFrom(
          backgroundColor: kBlack,
          foregroundColor: kWhite,
          shape: const StadiumBorder(),
        ),
        child: const Text('Sign out'),
      ),
    );
  }
}
