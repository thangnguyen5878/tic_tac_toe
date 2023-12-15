import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tic_tac_toe/models/online_player.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constant.dart';

class FirestoreService {
  late final CollectionReference _userRef;

  FirestoreService() {
    _userRef = firestore.collection('players').withConverter<OnlinePlayer>(
        fromFirestore: (snapshots, _) => OnlinePlayer.fromJson(snapshots.data()!),
        toFirestore: (user, _) => user.toJson());
  }

  Stream<QuerySnapshot> getOtherOnlineUsers() {
    return firestore.collection('players')
        .where('uid', isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('isOnline', isEqualTo: true)
        .snapshots();
  }

  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await firestore.collection('players').doc(uid).update(data);
  }



  // void addTodo(Room todo) {
  //   _todoRef.add(todo);
  // }

  // void updateTodo(String todoId, Room todo) {
  //   _todoRef.doc(todoId).update(todo.toJson());
  // }

  // void deleteTodo(String todoId) {
  //   _todoRef.doc(todoId).delete();
  // }
}
