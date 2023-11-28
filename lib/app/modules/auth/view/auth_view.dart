import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/auth_controller.dart';

import 'package:get/get.dart';


class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthView'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SignInButton(
            //   Buttons.google,
            //   text: "Sign in with Google",
            //   onPressed: () {},
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            // )
          ],
        ),
      )
    );
  }
}
