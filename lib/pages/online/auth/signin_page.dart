import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/appbar_painter.dart';
import 'package:flutter_tic_tac_toe/components/buttons/custom_back_button.dart';
import 'package:flutter_tic_tac_toe/components/buttons/google_signin_button.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../utils/constants/constants.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  void onBackPressed() {
    Get.offAllNamed(Routes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        onBackPressed();
      },
      child: Scaffold(
        backgroundColor: Colors.brown.shade50,
        appBar: _buildAppBar(),
        body: Container(
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GoogleSignInButton(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(240),
      child: Stack(children: [
        CustomPaint(
          // custom paint widget
          painter: AppBarPainter(), // custom painter class
          child: _buildWelcomeText(),
        ),
        _buildBackButton(),
      ]),
    );
  }

  Positioned _buildBackButton() {
    return Positioned(
        top: 28,
        child: CustomBackButton(
            color: kWhite,
            onPress: () {
              onBackPressed();
            }));
  }

  Container _buildWelcomeText() {
    return Container(
      padding: const EdgeInsets.fromLTRB(28, 90, 28, 0),
      child: Center(
        child: Column(
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Gap(8),
            Text(
              'Log in and connect with players around the world to play online games.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Gap(16),
          ],
        ),
      ),
    );
  }
}
