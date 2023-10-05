import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/app/modules/game/game_binding.dart';
import 'package:flutter_tic_tac_toe/app/modules/home/home_binding.dart';
import 'package:flutter_tic_tac_toe/isar_service.dart';
import 'package:flutter_tic_tac_toe/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // IsarService isarService = IsarService();
  // isarService.cleanDB();

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
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: HomeBinding(),
    ),
  );
}
