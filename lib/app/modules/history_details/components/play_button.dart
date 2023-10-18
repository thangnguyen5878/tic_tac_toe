import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/constants/app_colors.dart';

class PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Icon(Icons.play_arrow, color: Colors.black, size: 35),
      onPressed: () {},
      style: TextButton.styleFrom(elevation: 1, backgroundColor: kPurple30),
    );
  }
}
