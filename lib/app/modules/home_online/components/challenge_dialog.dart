import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';

class ChallengleDialog extends StatelessWidget {
  const ChallengleDialog({
    super.key,
    required this.player,
  });

  final Map<String, dynamic> player;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('CHALLENGE THE PLAYER', style: kHeading2,),
      content: Text(player['email']),
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
    );
  }
}