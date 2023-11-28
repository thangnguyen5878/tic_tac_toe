
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/components/sign_out_button.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class UserInfoAuthView extends StatelessWidget {
  const UserInfoAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('User Info'),
      // ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignOutButton()
          ],
        ),
      ),
    );
  }
}

