import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/table_controller.dart';
import 'cell_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('build table page...');
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        TableController.to.clearInput();
        TableController.to.emptyXOList();
        TableController.to.resetPlayer();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Table Page'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              TableController.to.clearInput();
              Get.back();
              FocusScope.of(context).unfocus();
              TableController.to.resetPlayer();
            },
          ),
        ),
        body: Stack(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(height: 10),
                  _buildBoard(context),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
          _buildPlayersBottomBar(),
        ]),
      ),
    );

    
  }
  
  Positioned _buildPlayersBottomBar() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.grey,
        height: 50,
        child: GetBuilder(builder: (TableController controller) {
          final currentPlayerXO = TableController.to.currentPlayerXO;
          final player1 = TableController.to.player1;
          final player2 = TableController.to.player2;

          final xColor = currentPlayerXO == 'X' ? Colors.black : const Color.fromARGB(200, 100, 100, 100);
          final oColor = currentPlayerXO == 'O' ? Colors.black : const Color.fromARGB(200, 100, 100, 100);
          final xBoxColor = currentPlayerXO == 'X' ? const Color.fromARGB(211, 193, 100, 100) : Colors.grey;
          final oBoxColor = currentPlayerXO == 'O' ? const Color.fromARGB(211, 193, 100, 100) : Colors.grey;

          final player1Color = currentPlayerXO == player1 ? Colors.black : Colors.grey;
          final player2Color = currentPlayerXO == player2 ? Colors.black : Colors.grey;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Player 1 Box
              Expanded(
                child: Container(
                  color: xBoxColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (player1.isNotEmpty)
                        Text(
                          player1,
                          style: TextStyle(color: xColor, fontWeight: FontWeight.bold),
                        ),
                      Text('X', style: TextStyle(color: xColor, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              // Player 2 Box
              Expanded(
                child: Container(
                  color: oBoxColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (player2.isNotEmpty)
                        Text(
                          player2,
                          style: TextStyle(color: oColor, fontWeight: FontWeight.bold),
                        ),
                      Text(
                        'O',
                        style: TextStyle(color: oColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

Widget _buildBoard(BuildContext context) {
  print('build table...');
  final _columns = TableController.to.columns;
  final _rows = TableController.to.rows;
  final _cellEdgeSize = (MediaQuery.of(context).size.width - 10 * 2) / _columns;

  return Container(
    decoration: BoxDecoration(border: Border.all(width: 1)),
    child: GridView.builder(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _columns,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 1,
      ),
      itemCount: _columns * _rows,
      itemBuilder: (context, index) {
        return CellWidget(
          row: index ~/ _columns,
          column: index % _columns,
        );
      },
    ),
  );
}


