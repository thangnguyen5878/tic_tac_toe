import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tic_tac_toe/utils/constants/constants.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        updateUserPresence(true);
      }
    } catch (e) {
      logger.t('ERROR: Sign in with Google: $e');
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();
  }

  Future<void> updateUserPresence(bool isOnline) async {
    final user = FirebaseAuth.instance.currentUser!;
    await firestore.collection('players').doc(user.uid).update({
      'isOnline': isOnline,
    });
  }
}
