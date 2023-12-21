import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/modules/online/auth/view/signin_page.dart';
import 'package:flutter_tic_tac_toe/modules/online/auth/view/welcome_page.dart';
import 'package:flutter_tic_tac_toe/models/online/online_user.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constant.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final RxList<User> onlineUsers = RxList<User>();
  var user = Rx<User?>(null);
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() async {
    super.onInit();
    // _listenToOnlineUsers();
    updateUserOnlineStatus(true); // Update current user's status on init
  }

  @override
  void onReady() {
    super.onReady();
    user.value = auth.currentUser;
    user.bindStream(auth.userChanges());
    ever(user, initialScreen);
  }

  @override
  void onClose() {
    updateUserOnlineStatus(false); // Update current user's status on close
    super.onClose();
  }

  initialScreen(User? user) {
    if (user == null) {
      Get.off(() => const SignInPage());
    } else {
      updateUserOnlineStatus(true);
      Get.off(() => WelcomePage());
    }
    debugPrint('Auth Route Navigation');
  }

  Future<void> updateUserOnlineStatus(bool isOnline) async {
    await FirebaseFirestore.instance.collection('players').doc(firebaseAuth.currentUser!.uid).update({
      'isOnline': isOnline,
    });
    print('updateUserOnlineStatus $isOnline');
  }

  Stream<List<OnlineUser>> getOnlineUsers() {
    return FirebaseFirestore.instance.collection('players')
        .where('isOnline', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => OnlineUser.fromJson(doc.data())).toList());
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
      firestoreService.createUserDocument(userCredential);
    } catch (error) {
      Get.snackbar(
        'ERROR',
        'loi roi',
        snackPosition: SnackPosition.BOTTOM,
      );
      debugPrint('Sign in with Google $error');
    }
  }

  Future<void> signOut() async {
    updateUserOnlineStatus(false);
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    debugPrint('Signed out');
  }
}