import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';

class OnlinePlayerTile extends StatelessWidget {
  final DocumentSnapshot doc;
  OnlinePlayerTile({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    final data = doc!.data() as Map<String, dynamic>;
    if (FirebaseAuth.instance.currentUser!.email != data['email']) {
      return ListTile(
        title: Text(data['email']),
        onTap: () {
          print('show alert dialog');
          showDialog<void>(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('CHALLENGE THE PLAYER', style: kHeading2,),
              content: Text(data['email']),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => {
                    // Update profile logic
                    // Navigator.pop(context),
                  },
                  child: Text('Start'),
                ),
              ],
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
