import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color; // Changed to final due to potential state change
  final VoidCallback? onPress; // Renamed type for clarity

  CustomBackButton({super.key, required this.onPress, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.only(left: 16),
      icon: Icon(
        Icons.arrow_back,
        color: color ?? kBlack,
        size: kIconSize,
      ),
      onPressed: onPress,
    );
  }
}
