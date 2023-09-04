import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/table_controller.dart';
import 'package:tic_tac_toe/utils/constants/colors.dart';

class WinnerPage extends StatelessWidget {
  const WinnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Scaffold(
          backgroundColor: Color.fromARGB(125, 0, 0, 0),
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Winner',
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
                Text(
                  '${TableController.to.winner}',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
