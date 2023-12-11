import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/view/signin_view.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/view/welcome_view.dart';
import 'package:flutter_tic_tac_toe/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AuthController.to.user.value == null
          ? SignInView()
          : WelcomeView();
    });
  }
}
