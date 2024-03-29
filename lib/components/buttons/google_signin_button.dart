import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/auth_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:get/get.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: Get.width * 0.8, minHeight: 48),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: kWhite,
              foregroundColor: kBlack,
              shape: const StadiumBorder(side: BorderSide(color: kBlack, width: 1.5)),
              elevation: 0,
              shadowColor: Colors.transparent),
          onPressed: () {
            AuthController.to.signInWithGoogle();
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage('assets/images/google_logo.png'),
                width: 20,
                height: 20,
              ),
              SizedBox(
                width: 16,
              ),
              Text('Sign in with Google'),
            ],
          )),
    );
  }
}
