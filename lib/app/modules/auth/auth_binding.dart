import 'package:flutter_tic_tac_toe/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
