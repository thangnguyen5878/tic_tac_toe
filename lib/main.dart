import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/home/home_binding.dart';
import 'package:flutter_tic_tac_toe/controllers/auth_controller.dart';
import 'package:flutter_tic_tac_toe/firebase_options.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      // home: UserInfoAuthView(),
      // home: AuthView(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: HomeBinding(),
      theme: ThemeData(
        backgroundColor: kWhite,
        scaffoldBackgroundColor: kWhite,
      ),
    ),
  );
}
