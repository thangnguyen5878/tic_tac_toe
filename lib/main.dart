import 'package:tic_tac_toe/views/input_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/table_controller.dart';
import 'views/table_page.dart';
import 'views/input_page.dart';

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
      home: InputPage(),
    );
  }
}
