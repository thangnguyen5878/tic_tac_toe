import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/modules/online/home_online/components/show_invited_dialog.dart';

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
          print('show alert dialog');
          showInvitedDialog(context, opponent);
          // showChallengleDialog(context, player);
        },
      );
    } else {
      return Container();
    }
  }
}


