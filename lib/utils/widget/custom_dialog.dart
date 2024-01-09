import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> children;
  bool? hasCloseIconButton = false;
  VoidCallback? onClose = () {};

  CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.children,
    this.hasCloseIconButton,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCloseIconButton(),
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: children),
          ],
        ),
      ),
    );
  }

  StatelessWidget _buildCloseIconButton() {
    if (hasCloseIconButton == true) {
      return Container(
        height: 24,
        alignment: Alignment.topLeft,
        child: IconButton(icon: FaIcon(FontAwesomeIcons.circleXmark), onPressed: onClose),
      );
    } else {
      return Placeholder();
    }
  }
}
