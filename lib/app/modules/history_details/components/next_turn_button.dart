import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';

class NextTurnButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Icon(Icons.chevron_right, color: Colors.black, size: 35),
      onPressed: () {},
      style: TextButton.styleFrom(elevation: 1, backgroundColor: kBlue30),
    );
  }
}
