import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constant.dart';

class FirestoreService {
  // late final CollectionReference _userRef;
  //
  // FirestoreService() {
  //   _userRef = firestore.collection('players').withConverter<OnlinePlayer>(
  //       fromFirestore: (snapshots, _) => OnlinePlayer.fromJson(snapshots.data()!),
  //       toFirestore: (user, _) => user.toJson());
  // }

  Future<void> createUserDocument(UserCredential userCredential) async {
    if (userCredential.user != null) {
      debugPrint('createUserDocument');
      print(userCredential.user);
      await FirebaseFirestore.instance
          .collection('players')
          .doc(userCredential.user!.uid)
          .set({
        'uid': userCredential.user!.uid,
        'email': userCredential.user!.email,
        'username': userCredential.user!.displayName,
        'isOnline': true,
        'status': 'idle'
      });
      debugPrint('User info saved to firestore');
    }
  }

  Stream<QuerySnapshot> getOnlineUsers() {
    return firestore.collection('players')
        // .where('uid', isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('isOnline', isEqualTo: true)
        .snapshots();
  }

  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await firestore.collection('players').doc(uid).update(data);
  }
}
