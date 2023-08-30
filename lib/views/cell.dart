import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/table_controller.dart';

class Cell extends StatelessWidget {
  int row = -1;
  int column = -1;
  Cell({super.key, required this.row, required this.column});

  @override
  Widget build(BuildContext context) {
    print('build Cell row: $row, column: $column');
    return Container(
      width: 100,
      height: 100,
      // alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
      child: InkWell(
        child: Center(
          child: GetBuilder(
            init: TableController(),
            builder: (TableController controller) {
              return Text(
                TableController.to.listXO[row][column],
                style: TextStyle(fontSize: 20, color: Colors.black),
              );
            },
          ),
        ),
        onTap: () => TableController.to.drawXO(row, column),
      ),
    );
  }
}
