import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/modules/online/auth/components/google_signin_button.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        Get.offAllNamed(Routes.HOME);
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GoogleSignInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
