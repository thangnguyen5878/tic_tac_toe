import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/models/online/online_user.dart';
import 'package:flutter_tic_tac_toe/modules/online/auth/view/signin_page.dart';
import 'package:flutter_tic_tac_toe/modules/online/auth/view/welcome_page.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
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
      Get.off(() => const WelcomePage());
    }
    logger.t('Auth Route Navigation');
  }

  Future<void> updateUserOnlineStatus(bool isOnline) async {
    await FirebaseFirestore.instance.collection('users').doc(firebaseAuth.currentUser!.uid).update({
      'isOnline': isOnline,
    });
  }

  Stream<List<OnlineUser>> getOnlineUsers() {
    return FirebaseFirestore.instance
        .collection('players')
        .where('isOnline', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => OnlineUser.fromJson(doc.data())).toList());
  }

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

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      logger.t('Signed in with Google');
      logger.i(userCredential);
      firestoreService.createUserDocument(userCredential);
    } catch (error) {
      Get.snackbar(
        'ERROR',
        'loi roi',
        snackPosition: SnackPosition.BOTTOM,
      );
      logger.e('Sign in with Google $error');
    }
  }

  Future<void> signOut() async {
    logger.t('sign out');
    OnlineUserController.to.handleSignOut();
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }
}
