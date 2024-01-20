import 'package:flutter_tic_tac_toe/models/online_user.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class FirestoreServiceTest {
  static void addOnlineUser() {
    OnlineUser newUser1 = OnlineUser(name: 'User 1', email: 'user1@gmail.com');
    firestoreService.addUser(newUser1);
    OnlineUser newUser2 = OnlineUser(name: 'User 2', email: 'user2@gmail.com');
    firestoreService.addUser(newUser2);
    OnlineUser newUser3 = OnlineUser(name: 'User 3', email: 'user3@gmail.com');
    firestoreService.addUser(newUser3);
  }

  static void deleteUser() {
    String deleteUserUid = 'c0a1ddeb-7ae4-4db2-83ac-6563d161ef4d';
    firestoreService.deleteUser(deleteUserUid);
  }
}
