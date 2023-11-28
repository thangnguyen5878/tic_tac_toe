import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/auth_controller.dart';

import 'package:get/get.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('AuthView'),
        //   centerTitle: true,
        // ),
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _signInWithGoogleButton(),
        ],
      ),
    ));
  }

  ConstrainedBox _signInWithGoogleButton() {
    return ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: Get.width - 60,
          ),
          child: FloatingActionButton.extended(
            elevation: 2,
            onPressed: () {},
            label: Text('Sign in with Google'),
            backgroundColor: Colors.black,
            icon: Image.asset(
                  'assets/images/google_logo_dark.png',
                  width: 16,
                  height: 16,
                  color: Colors.white,
              ),
            ),
          );
  }
}
