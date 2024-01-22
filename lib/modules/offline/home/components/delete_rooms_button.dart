import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/home_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class DeleteRoomsButton extends StatelessWidget {
  const DeleteRoomsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        logger.t('Press delete rooms button.');
        HomeController.to.removeSelectedRoomsFromDatabase();
      },
      icon: const Icon(
        Icons.delete,
        color: kBlack,
        size: kIconSize,
      ),
    );
  }
}
