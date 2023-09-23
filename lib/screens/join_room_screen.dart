import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/global_controller.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';
import 'package:tic_tac_toe/widgets/custom_text_field.dart';

class JoinRoomScreen extends StatelessWidget {
  static String routeName = '/create_room';
  const JoinRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Join room',
                style: TextStyle(
                  fontSize: 70,
                )),
            SizedBox(height: Get.height * 0.08),
            CustomTextField(
              controller: GlobalController.to.inputNameController,
              hintText: 'Enter your nickname',
              bgColor: Colors.white,
            ),
            SizedBox(height: Get.height * 0.015),
            CustomTextField(
              controller: GlobalController.to.inputNameController,
              hintText: 'Enter your Game ID',
              bgColor: Colors.white,
            ),
            SizedBox(height: Get.height * 0.03),
            CustomButton(
                onTap: () {
                  //  _socketMethods.createRoom(
                  //     _nameController.text,)
                },
                text: 'Create'),
          ],
        ),
      ),
    );
  }
}

