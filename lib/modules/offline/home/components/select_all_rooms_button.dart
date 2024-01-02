import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/home_controller.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';

class SelectAllRoomsButton extends StatelessWidget {
  const SelectAllRoomsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        logger.t('press select all rooms button');
        HomeController.to.selectAllRooms();
      },
      icon: Icon(
        Icons.select_all,
        color: kBlack,
        size: kIconSize,
      ),
    );
  }
}