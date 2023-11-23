import 'package:get/get.dart';

import '../app/modules/auth/bindings/auth_binding.dart';
import '../app/modules/auth/views/auth_view.dart';
import '../app/modules/create_room/create_room_binding.dart';
import '../app/modules/create_room/create_room_view.dart';
import '../app/modules/game/game_binding.dart';
import '../app/modules/game/game_view.dart';
import '../app/modules/history/history_binding.dart';
import '../app/modules/history/history_view.dart';
import '../app/modules/history_details/history_details_binding.dart';
import '../app/modules/history_details/history_details_view.dart';
import '../app/modules/home/home_binding.dart';
import '../app/modules/home/home_view.dart';
import '../app/modules/winner/winner_binding.dart';
import '../app/modules/winner/winner_view.dart';

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
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_DETAILS,
      page: () => HistoryDetailsView(),
      binding: HistoryDetailsBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
  ];
}
