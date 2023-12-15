import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/auth/components/sign_out_button.dart';
import 'package:flutter_tic_tac_toe/controllers/auth_controller.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_cache.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_size.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class WelcomePage extends StatefulWidget {
  WelcomePage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Get.offAllNamed(Routes.HOME_ONLINE);
        return true; // Inside async block now
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(user!.photoURL!,
                        cacheManager: appCacheManager),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(user!.email!),
              Text(user!.displayName ?? " "),
              SizedBox(height: kPadding32),
              SignOutButton()
            ],
          ),
        ),
      ),
    );
  }
}
