// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/offline/create_room/create_room_binding.dart';
import '../modules/offline/create_room/create_room_page.dart';
import '../modules/offline/game/game_binding.dart';
import '../modules/offline/game/game_page.dart';
import '../modules/offline/history/history_binding.dart';
import '../modules/offline/history/history_page.dart';
import '../modules/offline/history_details/history_details_binding.dart';
import '../modules/offline/history_details/history_details_page.dart';
import '../modules/offline/home/home_binding.dart';
import '../modules/offline/home/home_page.dart';
import '../modules/offline/winner/winner_binding.dart';
import '../modules/offline/winner/winner_page.dart';
import '../modules/online/auth/auth_binding.dart';
import '../modules/online/auth/view/auth_page.dart';
import '../modules/online/home_online/home_online_page.dart';
import '../modules/online/online_game/online_game_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.GAME,
      page: () => GamePage(),
      binding: GameBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_ROOM,
      page: () => CreateRoomPage(),
      binding: CreateRoomBinding(),
    ),
    GetPage(
      name: _Paths.WINNER,
      page: () => const WinnerPage(),
      binding: WinnerBinding(),
      opaque: false,
      transitionDuration: const Duration(seconds: 0),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryPage(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_DETAILS,
      page: () => const HistoryDetailsPage(),
      binding: HistoryDetailsBinding(),
    ),
    GetPage(name: _Paths.AUTH, page: () => const AuthPage(), binding: AuthBinding(), children: [
      GetPage(
        name: _Paths.HOME_ONLINE,
        page: () => const HomeOnlinePage(),
        // binding: HomeOnlineBinding(),
      ),
      GetPage(
        name: _Paths.ONLINE_GAME,
        page: () => const OnlineGamePage(),
        // binding: OnlineGameBinding(),
      ),
    ]),
    GetPage(
      name: _Paths.HOME_ONLINE,
      page: () => const HomeOnlinePage(),
      // binding: HomeOnlineBinding(),
    ),
    GetPage(
      name: _Paths.ONLINE_GAME,
      page: () => const OnlineGamePage(),
      // binding: OnlineGameBinding(),
    ),
  ];
}
