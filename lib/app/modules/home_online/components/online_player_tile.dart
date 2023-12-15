import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/home_online/components/challenge_dialog.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';

class OnlinePlayerTile extends StatelessWidget {
  final DocumentSnapshot doc;
  OnlinePlayerTile({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    final player = doc!.data() as Map<String, dynamic>;
    if (FirebaseAuth.instance.currentUser!.email != player['email']) {
      return ListTile(
        title: Text(player['email']),
        onTap: () {
          print('show alert dialog');
          showDialog<void>(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => ChallengleDialog(player: player),
          );
        },
      );
    } else {
      return Container();
    }
  }
}


