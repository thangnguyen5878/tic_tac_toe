import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/table_controller.dart';
import 'package:tic_tac_toe/views/table_page.dart';

class InputPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _inputColumnsController = TextEditingController();
  TextEditingController _inputRowsController = TextEditingController();

  InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('build input page');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPlayer1InputField(),
                const SizedBox(height: 16),
                _buildPlayer2InputField(),
                const SizedBox(height: 16),
                _buildRowsInputField(),
                const SizedBox(height: 16),
                _buildColumnsInputField(),
                const SizedBox(height: 16),
                _playButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton _playButton(BuildContext context) {
    print('build play button');
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          TableController.to.createListXO();
          Get.to(() => TablePage());
          FocusScope.of(context).unfocus();
          TableController.to.clearInput();
        }

        // Get.to(() => const TablePage());
      },
      child: const Text('Play'),
    );
  }

  TextFormField _buildPlayer1InputField() {
    print('build player 1 input field');
    return TextFormField(
      controller: TableController.to.inputPlayer1Controller,
      keyboardType: TextInputType.text,
      autofocus: false,
      onSaved: (value) {
        if (value != '') TableController.to.setPlayer1(value!);
      },
      decoration: const InputDecoration(labelText: 'Player 1'),
    );
  }

  TextFormField _buildPlayer2InputField() {
    print('build player 2 input field');
    return TextFormField(
      controller: TableController.to.inputPlayer2Controller,
      keyboardType: TextInputType.text,
      autofocus: false,
      onSaved: (value) {
        if (value != '') TableController.to.setPlayer2(value!);
      },
      decoration: const InputDecoration(labelText: 'Player 2'),
    );
  }

  TextFormField _buildColumnsInputField() {
    print('build columns input field');
    return TextFormField(
      controller: TableController.to.inputColumnsController,
      keyboardType: TextInputType.number,
      autofocus: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        }
        final intValue = int.tryParse(value);
        if (intValue == null || intValue < 5 || intValue > 12) {
          return 'Please enter a valid integer between 5 and 12';
        }
        return null;
      },
      onSaved: (value) {
        TableController.to.setColumns(int.tryParse(value!) ?? 0);
      },
      decoration: const InputDecoration(labelText: 'Enter Column Count (5-12)'),
    );
  }

  TextFormField _buildRowsInputField() {
    print('build rows input field');
    return TextFormField(
      controller: TableController.to.inputRowsController,
      keyboardType: TextInputType.number,
      autofocus: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        }
        final intValue = int.tryParse(value);
        if (intValue == null || intValue < 5 || intValue > 18) {
          return 'Please enter a valid integer between 5 and 18';
        }
        return null;
      },
      onSaved: (value) {
        TableController.to.setRows(int.tryParse(value!) ?? 0);
      },
      decoration: const InputDecoration(labelText: 'Enter Row Count (5-18)'),
    );
  }
}
