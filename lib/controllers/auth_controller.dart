import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/view/signin_view.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/view/welcome_view.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  var user = Rx<User?>(null);
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    user.value = auth.currentUser;
    user.bindStream(auth.userChanges());
    ever(user, initialScreen);
  }

  initialScreen(User? user) {
    if (user == null) {
      Get.off(() => SignInView());
    } else {
      Get.off(() => WelcomeView());
    }
    debugPrint('Auth Route Navigation');
  }

  signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint('Signed in with Google');
      createUserDocument(userCredential);
    } catch (error) {
      Get.snackbar(
        'ERROR',
        'loi roi',
        snackPosition: SnackPosition.BOTTOM,
      );
      debugPrint('Sign in with Google $error');
    }
  }

  Future<void> createUserDocument(UserCredential userCredential) async {
    if (userCredential.user != null) {
      debugPrint('createUserDocument');
      print(userCredential.user);
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.uid)
          .set({
        'email': userCredential.user!.email,
        'username': userCredential.user!.displayName
      });
      debugPrint('User info saved to firestore');
    }
  }

  Future<void> signOut() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    debugPrint('Signed out');
  }
}
