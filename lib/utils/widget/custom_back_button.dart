import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';

// ignore: must_be_immutable
class CustomBackButton extends StatelessWidget {
  void Function()? onPress;

  CustomBackButton({
    super.key, required Function onPress
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.only(left: 16),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: kBlack,
        size: kIconSize,
      ),
      onPressed: onPress,
    );
  }
}
