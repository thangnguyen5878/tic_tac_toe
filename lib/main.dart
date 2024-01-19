import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/firebase_options.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/initial_binding.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // String player1Id = 'aaaaaaaaaaaaaaaaaa';
  // String player2Id = 'bbbbbbbbbbbbbbbbbb';
  // Get.put(OnlineGameController());
  // OnlineGameController.to.createRoom(player1Id, player2Id);
  // OnlineGameController.to.pushRoomToFirebase();

  runApp(
    GetMaterialApp(
      defaultTransition: Transition.noTransition,
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),
      theme: ThemeData(
        scaffoldBackgroundColor: kWhite,
      ),
    ),
  );
}
