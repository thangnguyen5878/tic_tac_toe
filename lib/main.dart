import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/views/pages/input_page.dart';
import 'package:tic_tac_toe/views/pages/winner_page.dart';

import 'controllers/global_controller.dart';

void main() {
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
          page: () => const WinnerPage(),
          opaque: false,
          transitionDuration: const Duration(seconds: 0),
          // transition: Transition.downToUp
        )
      ],
      home: InputPage(),
    );
  }
}
