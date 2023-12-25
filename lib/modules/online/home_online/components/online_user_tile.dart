import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/models/online/online_user.dart';

class OnlineUserTile extends StatelessWidget {
  final OnlineUser user;
  OnlineUserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser!.email != user.email) {
      return ListTile(
        // title: Text(user.toString()),
        title: Text(user.email),
        onTap: () {
          OnlineUserController.to.selectOpponent(user.uid);
        },
      );
    } else {
      return Container();
    }
  }
}


