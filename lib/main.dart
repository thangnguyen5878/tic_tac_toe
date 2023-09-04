import 'package:tic_tac_toe/_temp/_my_button.dart';
import 'package:tic_tac_toe/views/input_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/views/winner_page.dart';

import 'controllers/table_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final TableController tableController = Get.put(TableController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/winner',
          page: () => WinnerPage(),
          opaque: false,
          transitionDuration: Duration(seconds: 0),
          // transition: Transition.downToUp
          
        )
      ],
      home: InputPage(),
    );
  }
}
