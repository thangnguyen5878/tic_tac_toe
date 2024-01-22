import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/dialogs/next_round_dialog.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';

class NextRoundButton extends StatelessWidget {
  const NextRoundButton({
    super.key,
  });

  @override
  build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.forward,
        color: kBlack,
        size: kIconSize,
      ),
      onPressed: () {
        Get.dialog(NextRoundDialog(), barrierDismissible: false);
      },
    );
  }
}
