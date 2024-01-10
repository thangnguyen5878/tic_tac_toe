import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_cache.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get.dart';

import '../../../../controllers/auth_controller.dart';

class OfflineDrawer extends StatelessWidget {
  const OfflineDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Drawer(
        backgroundColor: kWhite, // Đặt màu nền của Drawer là kWhite
        child: Column(
          children: [
            _buildDrawerHeader(),
          ],
        ),
      );
    });
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
            backgroundColor: kGrey45,
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
