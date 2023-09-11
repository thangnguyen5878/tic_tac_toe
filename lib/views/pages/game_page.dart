import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/global_controller.dart';
import 'package:tic_tac_toe/utils/seed.dart';

import '../widgets/cell_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('build game page...');
    return WillPopScope(
        onWillPop: () async {
          Get.back();
          GlobalController.to.resetGame();
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: GetBuilder<GlobalController>(
              builder: (controller) {
                return Text(
                  'Round: ${controller.game.roundCount}',
                  style: TextStyle(fontSize: 18),
                );
              },
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
                GlobalController.to.resetGame();
                FocusScope.of(context).unfocus();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  GlobalController.to.nextRound();
                },
              ),
            ],
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
        ));
  }

  Positioned _buildPlayersBottomBar() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.grey,
        height: 50,
        child: GetBuilder(builder: (GlobalController controller) {
          final currentPlayer = GlobalController.to.game.currentPlayer;
          final player1 = GlobalController.to.game.player1;
          final player2 = GlobalController.to.game.player2;

          final xColor = currentPlayer.seed == Seed.cross
              ? Colors.black
              : const Color.fromARGB(200, 100, 100, 100);
          final oColor = currentPlayer.seed == Seed.nought
              ? Colors.black
              : const Color.fromARGB(200, 100, 100, 100);
          final xBoxColor = currentPlayer.seed == Seed.cross
              ? const Color.fromARGB(211, 193, 100, 100)
              : Colors.grey;
          final oBoxColor = currentPlayer.seed == Seed.nought
              ? const Color.fromARGB(211, 193, 100, 100)
              : Colors.grey;

          // final player1Color = currentPlayerXO == player1 ? Colors.black : Colors.grey;
          // final player2Color = currentPlayerXO == player2 ? Colors.black : Colors.grey;

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
                      if (player1.name.isNotEmpty)
                        Text(
                          '${player1.name}: X',
                          style: TextStyle(
                              color: xColor, fontWeight: FontWeight.bold),
                        ),
                  Text('Score: ${player1.score}',
                          style: TextStyle(
                              color: xColor, fontWeight: FontWeight.bold)),
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
                      if (player2.name.isNotEmpty)
                        Text(
                          '${player2.name}: O',
                          style: TextStyle(
                              color: oColor, fontWeight: FontWeight.bold),
                        ),
                      Text(
                        'Score: ${player2.score}',
                        style: TextStyle(
                            color: oColor, fontWeight: FontWeight.bold),
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
  print('build board...');
  final columns = GlobalController.to.game.board.columns;
  final rows = GlobalController.to.game.board.rows;

  return Container(
    decoration: BoxDecoration(border: Border.all(width: 1)),
    child: GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 1,
      ),
      itemCount: columns * rows,
      itemBuilder: (context, index) {
        return CellWidget(
          row: index ~/ columns,
          column: index % columns as int,
        );
      },
    ),
  );
}
