import 'package:get/get.dart';

import '../app/modules/create_room/bindings/create_room_binding.dart';
import '../app/modules/create_room/views/create_room_view.dart';
import '../app/modules/game/game_binding.dart';
import '../app/modules/game/game_view.dart';
import '../app/modules/history/history_binding.dart';
import '../app/modules/history/history_view.dart';
import '../app/modules/home/home_binding.dart';
import '../app/modules/home/home_view.dart';
import '../app/modules/winner/bindings/winner_binding.dart';
import '../app/modules/winner/views/winner_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.GAME,
      page: () => GameView(),
      binding: GameBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_ROOM,
      page: () => CreateRoomView(),
      binding: CreateRoomBinding(),
    ),
    GetPage(
      name: _Paths.WINNER,
      page: () => WinnerView(),
      binding: WinnerBinding(),
      opaque: false,
      transitionDuration: const Duration(seconds: 0),
    ),
  ];
}
