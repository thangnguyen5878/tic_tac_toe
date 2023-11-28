import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/auth_controller.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/components/google_sign_in_button.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';

import 'package:get/get.dart';
import 'package:sign_in_button/sign_in_button.dart';

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
          GoogleSignInButton()
        ],
      ),
    ));
  }
}


