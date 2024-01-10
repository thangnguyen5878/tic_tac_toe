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

  // Get.put(OnlineGameController());
  // OnlineRoom room1 = OnlineRoom();
  // OnlineGameController.to.pushRoomToFirebaseWithArgument(room1);

  // final object = OnlineRoom.fromJson(roomJsonSnippet);
  // logger.i(object);

  runApp(
    GetMaterialApp(
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
