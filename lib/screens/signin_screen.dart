import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:tic_tac_toe/screens/test_screen.dart';

class SigninScreen extends StatelessWidget {
  static String routeName = '/sign_in';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  SigninScreen({super.key});

  Future<User?> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      return user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 35,
              child: SignInButton(
                Buttons.Google,
                onPressed: () async {
                  final user = await _handleSignIn();
                  if (user != null) {
                    // Đăng nhập thành công, điều hướng đến trang chính của ứng dụng bằng GetX
                    Get.off(() => const TestScreen()); // Use GetX for navigation
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 35,
              child: SignInButton(
                Buttons.Facebook,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
