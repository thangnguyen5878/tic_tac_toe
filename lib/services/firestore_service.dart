// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class FirestoreService {
//   final _firestore = FirebaseFirestore.instance;
//   late final CollectionReference _todoRef;
//
//   FirestoreService() {
//     _todoRef = _firestore.collection('Rooms').withConverter<Room>(
//         fromFirestore: (snapshots, _) => Room.fromJson(snapshots.data()!),
//         toFirestore: (todo, _) => todo.toJson());
//   }
//
//   Stream<QuerySnapshot> getTodos() {
//     return _todoRef
//         .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         .snapshots();
//   }
//
//   void addTodo(Todo todo) {
//     _todoRef.add(todo);
//   }
//
//   void updateTodo(String todoId, Todo todo) {
//     _todoRef.doc(todoId).update(todo.toJson());
//   }
//
//   void deleteTodo(String todoId) {
//     _todoRef.doc(todoId).delete();
//   }
// }
