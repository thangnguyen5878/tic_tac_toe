import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/screens/input_screen.dart';
import 'package:tic_tac_toe/screens/main_memu_screen.dart';
import 'package:tic_tac_toe/screens/winner_screen.dart';
import 'controllers/global_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalController tableController = Get.put(GlobalController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      getPages: [
        
        GetPage(
          name: '/winner',
          page: () => const WinnerScreen(),
          opaque: false,
          transitionDuration: const Duration(seconds: 0),
          // transition: Transition.downToUp
        )
      ],
      home: InputScreen(),
    );
  }
}
