import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/modules/online/auth/view/signin_page.dart';
import 'package:flutter_tic_tac_toe/modules/online/auth/view/welcome_page.dart';
import 'package:flutter_tic_tac_toe/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AuthController.to.user.value == null
          ? SignInPage()
          : WelcomePage();
    });
  }
}
