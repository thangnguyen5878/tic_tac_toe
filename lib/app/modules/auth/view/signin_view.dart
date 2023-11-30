import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/components/google_sign_in_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GoogleSignInButton(),
          ],
        ),
      ),
    );
  }
}
