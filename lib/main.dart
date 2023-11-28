import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/home/home_binding.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';

import 'package:get/get.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // IsarService isarService = IsarService();
  // isarService.cleanDB();
  //
  // final dir = await getApplicationDocumentsDirectory();
  // final isar = await Isar.open(
  //   [RoomSchema],
  //   directory: dir.path,
  // );
  // Room room1 = Room();
  // await isar.writeTxn(() async {
  //   await isar.rooms.put(room1);
  // });
  // print('Room: $room1');
  // print('Player 2: ${room1.players![1]}');

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      // home: UserInfoAuthView(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: HomeBinding(),
    ),
  );
}
