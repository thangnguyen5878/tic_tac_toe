import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/table_controller.dart';
import '../views/cell.dart';

class TablePage extends StatelessWidget {
  TablePage({super.key});

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
                  _buildTable(),
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
          final _currentPlayerXO = TableController.to.currentPlayerXO;
          final _player1 = TableController.to.player1;
          final _player2 = TableController.to.player2;

          final _xColor = _currentPlayerXO == 'X' ? Colors.black : const Color.fromARGB(200, 100, 100, 100);
          final _oColor = _currentPlayerXO == 'O' ? Colors.black : const Color.fromARGB(200, 100, 100, 100);
          final _xBoxColor = _currentPlayerXO == 'X' ? Color.fromARGB(211, 193, 100, 100) : Colors.grey;
          final _oBoxColor = _currentPlayerXO == 'O' ? Color.fromARGB(211, 193, 100, 100) : Colors.grey;
          
          final _player1Color = _currentPlayerXO == _player1 ? Colors.black : Colors.grey;
          final _player2Color = _currentPlayerXO == _player2 ? Colors.black : Colors.grey;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Player 1 Box
              Expanded(
                child: Container(
                  color: _xBoxColor,
                  child: Column(    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_player1.isNotEmpty)
                        Text(
                          _player1,
                          style: TextStyle(
                            color: _xColor,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      Text('X',
                          style: TextStyle(
                            color: _xColor,
                            fontWeight: FontWeight.bold
                          )),
                    ],
                  ),
                ),
              ),
              // Player 2 Box
              Expanded(
                child: Container(
                  color: _oBoxColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_player2.isNotEmpty)
                        Text(
                          _player2,
                          style: TextStyle(
                            color: _oColor,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      Text(
                        'O',
                        style: TextStyle(
                          color: _oColor,
                          fontWeight: FontWeight.bold
                        ),
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

Widget _buildTable() {
  print('build table...');
  final columns = TableController.to.columns;
  final rows = TableController.to.rows;

  return GridView.builder(
    // scrollDirection: Axis.vertical,
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: columns,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      childAspectRatio: 1,
    ),
    itemCount: columns * rows,
    itemBuilder: (context, index) {
      return Cell(
        row: index ~/ columns,
        column: index % columns,
      );
    },
  );
}
