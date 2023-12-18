import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/online_player_controller.dart';

class OnlinePlayerTile extends StatelessWidget {
  final DocumentSnapshot doc;
  OnlinePlayerTile({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    final opponent = doc.data() as Map<String, dynamic>;
    if (FirebaseAuth.instance.currentUser!.email != opponent['email']) {
      return ListTile(
        title: Text(opponent['email']),
        onTap: () {
          OnlinePlayerController.to.selectOpponent(opponent['uid']);
        },
      );
    } else {
      return Container();
    }
  }
}


