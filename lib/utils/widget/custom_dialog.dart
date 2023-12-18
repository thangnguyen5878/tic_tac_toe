import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> children;

  CustomDialog({required this.title, required this.content, required this.children});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: kHeading2,
            ),
            const SizedBox(height: 16.0),
            Text(
              content,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: children
            ),
          ],
        ),
      ),
    );
  }
}