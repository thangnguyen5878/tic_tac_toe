import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/controllers/home_controller.dart';
import 'package:flutter_tic_tac_toe/modules/offline/home/components/app_drawer.dart';
import 'package:flutter_tic_tac_toe/modules/offline/home/components/delete_rooms_button.dart';
import 'package:flutter_tic_tac_toe/modules/offline/home/components/room_list.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:flutter_tic_tac_toe/utils/constants/service_constants.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    logger.t('build home screen...');
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        drawer: const AppDrawer(),
        appBar: _buildAppBar(),
        body: const RoomList(),
        floatingActionButton:
            HomeController.to.isRoomSelectionMode ? null : _buildFloatingActionButton(),
      );
    });
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        logger.t('press add room button');
        Get.toNamed(Routes.CREATE_ROOM);
      },
      backgroundColor: kBrown40,
      child: const Icon(Icons.add, size: kIconSize, color: kBrown15),
    );
  }

  AppBar _buildAppBar() {
    if (HomeController.to.isRoomSelectionMode) {
      return _appBarSelectionMode();
    } else {
      return _appBarNormalMode();
    }
  }

  AppBar _appBarSelectionMode() {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          // padding: const EdgeInsets.only(left: 16),
          icon: const Icon(
            Icons.close,
            color: kBlack,
            size: kIconSize,
          ),
          onPressed: () {
            logger.t('press close button');
            HomeController.to.deactivateRoomSelectionMode();
          },
        ),
      ),
      title: Container(
        padding: const EdgeInsets.only(top: 8, right: 32),
        alignment: Alignment.center,
      ),
      actions: const [
        DeleteRoomsButton(),
      ],
      backgroundColor: kWhite,
    );
  }

  AppBar _appBarNormalMode() {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(
            Icons.menu,
            color: kBlack,
            size: kIconSize,
          ),
          onPressed: () {
            logger.t('open drawer');
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      title: Container(
        padding: const EdgeInsets.only(top: 8, right: 32),
        alignment: Alignment.center,
        child: const Text('Tic-tac-toe', style: kTitle1),
      ),
      backgroundColor: kWhite,
    );
  }
}
