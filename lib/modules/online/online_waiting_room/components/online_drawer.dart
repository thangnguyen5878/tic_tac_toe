import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_cache.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';

import '../../../../controllers/auth_controller.dart';

class OnlineDrawer extends StatelessWidget {
  const OnlineDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentRoute = Get.currentRoute;
      final isOnlineWaitingRoom = currentRoute == Routes.ONLINE_WAITING_ROOM;
      final isOnlineHistory = currentRoute == Routes.ONLINE_HISTORY;

      return Drawer(
        backgroundColor: kWhite,
        child: Column(
          children: [
            _buildDrawerHeader(),
            _buildWaitingRoomTile(isOnlineWaitingRoom: isOnlineWaitingRoom),
            _buildHistoryTile(isOnlineHistory: isOnlineHistory),
          ],
        ),
      );
    });
  }

  ListTile _buildHistoryTile({required bool isOnlineHistory}) {
    return ListTile(
      leading: const Icon(Icons.history),
      title: Text(
        'History',
        style: isOnlineHistory ? kBoldText : kNormalText,
      ),
      tileColor:
          isOnlineHistory ? kSelectedDrawerTileColor : null, // Set conditional background color
      onTap: () async {
        // Get.back();
        // await Future.delayed(Duration(milliseconds: 150));
        Get.offNamed(Routes.ONLINE_HISTORY);
      },
    );
  }

  ListTile _buildWaitingRoomTile({required bool isOnlineWaitingRoom}) {
    return ListTile(
      leading: const Icon(Icons.house_rounded),
      title: Text(
        'Waiting Room',
        style: isOnlineWaitingRoom ? kBoldText : kNormalText,
      ),
      tileColor: isOnlineWaitingRoom ? kSelectedDrawerTileColor : null,
      onTap: () async {
        // Get.back();
        // await Future.delayed(Duration(milliseconds: 150));
        Get.offNamed(Routes.ONLINE_WAITING_ROOM);
      },
    );
  }

  UserAccountsDrawerHeader _buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: const BoxDecoration(
        color: kWhite,
      ),
      currentAccountPictureSize: const Size.square(56),
      // avatar
      currentAccountPicture: GestureDetector(
        child: ClipOval(
          child: CircleAvatar(
            backgroundColor: kDarkGrey,
            child: AuthController.to.user.value == null
                ? const Icon(
                    Icons.person,
                    color: kWhite,
                  )
                : CachedNetworkImage(
                    imageUrl: AuthController.to.user.value!.photoURL!,
                    fit: BoxFit.fitHeight,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    cacheManager: appCacheManager,
                  ),
          ),
        ),
        onTap: () {
          Get.toNamed(Routes.AUTH);
        },
      ),
      // user name
      accountName: Text(
        AuthController.to.user.value == null
            ? 'Not logged in'
            : AuthController.to.user.value!.displayName!,
        style: kSmallBoldText,
      ),
      // user email
      accountEmail: Text(
        AuthController.to.user.value == null
            ? 'Tap to open settings'
            : AuthController.to.user.value!.email!,
        style: kSmallText,
      ),
    );
  }
}
