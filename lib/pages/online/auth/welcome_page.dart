import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/components/appbar_painter2.dart';
import 'package:flutter_tic_tac_toe/components/buttons/custom_back_button.dart';
import 'package:flutter_tic_tac_toe/components/buttons/sign_out_button.dart';
import 'package:flutter_tic_tac_toe/controllers/auth_controller.dart';
import 'package:flutter_tic_tac_toe/controllers/online_user_controller.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_cache.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with WidgetsBindingObserver {
  User? user = AuthController.to.user.value;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    bool isOnline = state == AppLifecycleState.resumed || state == AppLifecycleState.inactive;

    if (isOnline) {
      AuthController.to.updateUserOnlineStatus(true);
    } else {
      AuthController.to.updateUserOnlineStatus(false);
    }
  }

  Future<void> onBackPressed() async {
    OnlineUserController.to.updateUserStatusToIdle();
    await Get.offAllNamed(Routes.ONLINE_WAITING_ROOM);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        onBackPressed();
      },
      child: Scaffold(
        backgroundColor: Colors.brown.shade50,
        appBar: _buildAppBar(),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [const SizedBox(height: 32), const SignOutButton()],
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(400),
      child: Stack(children: [
        CustomPaint(
          // custom paint widget
          painter: AppBarPainter2(), // custom painter class
          child: Container(
              padding: const EdgeInsets.only(left: 12, right: 12),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildAvatar(),
                  Gap(20),
                  // Name
                  Text(
                    user!.displayName ?? " ",
                    style: kHeading1White,
                  ),
                  // Email
                  Text(
                    user!.email!,
                    style: kNormalTextWhite,
                  ),
                ],
              )),
        ),
        _buildBackButton()
      ]),
    );
  }

  Positioned _buildBackButton() {
    return Positioned(
        top: 28,
        child: CustomBackButton(
            color: kWhite,
            onPress: () {
              onBackPressed();
            }));
  }

  Container _buildAvatar() {
    return Container(
      height: 72,
      width: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: CachedNetworkImageProvider(user!.photoURL!, cacheManager: appCacheManager),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
