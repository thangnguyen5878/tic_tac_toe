import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'history_detail_controller.dart';

class HistoryDetailView extends GetView<HistoryDetailController> {
  const HistoryDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HistoryDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
