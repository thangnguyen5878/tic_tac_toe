import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/auth_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/components/sign_out_button.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';

class WelcomeView extends StatelessWidget {
  WelcomeView({super.key});

  User? user = AuthController.instance.user.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(user!.photoURL!))),
            ),
            Text(user!.email!),
            Text(user!.displayName ?? " "),
            SizedBox(height: kPadding32),
            SignOutButton()
          ],
        ),
      ),
    );
  }
}
