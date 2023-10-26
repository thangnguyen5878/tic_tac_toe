import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: TextButton.styleFrom(elevation: 1, backgroundColor: kPurple30),
      child: const Icon(Icons.play_arrow, color: Colors.black, size: 35),
    );
  }
}
