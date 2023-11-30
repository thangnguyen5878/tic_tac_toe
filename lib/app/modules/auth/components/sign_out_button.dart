import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/auth_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:get/get.dart';

class SignOutButton extends StatelessWidget {

  const SignOutButton({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: Get.width * 0.8,
          minHeight: 48
      ),
      child: TextButton(
        onPressed: () {
          AuthController.to.signOut();
        },
        child: Text('Sign out'),
        style: TextButton.styleFrom(
          backgroundColor: kBlack,
          foregroundColor: kWhite,
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}