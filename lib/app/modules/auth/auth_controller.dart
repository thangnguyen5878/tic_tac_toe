
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/view/signin_view.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/view/welcome_view.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

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
    if(user == null) {
      Get.off(SignInView());
    } else {
      Get.off(WelcomeView());
    }
  }

  // homeScreen() {
  //   if(user == null) {
  //     return SigninPage();
  //   } else {
  //     return WelcomePage();
  //   }
  // }

  signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      Get.snackbar(
        'ERROR',
        'loi roi',
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Sign in with Google $error');
    }
  }

  Future<void> signOut() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }
}