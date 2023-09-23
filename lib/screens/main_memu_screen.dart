import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/screens/create_room_screen.dart';
import 'package:tic_tac_toe/screens/join_room_screen.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main_menu';
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              CustomButton(
              onTap: () {
                Get.to(const CreateRoomPage());
              },
              text: 'Create room'),
          const SizedBox(height: 10),
          CustomButton(
              onTap: () {
                Get.to(const JoinRoomScreen());
              },
              text: 'Join room'),
        ]),
      ),
    );
  }
}
