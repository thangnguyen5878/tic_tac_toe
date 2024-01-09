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
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        onClose;
      },
      child: Dialog(
        child: Stack(children: [
          _buildCloseIconButton(),
          _buildDialogBody(),
        ]),
      ),
    );
  }

  Container _buildDialogBody() {
    return Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
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
        );
  }

  Widget _buildCloseIconButton() {
    if (hasCloseIconButton == true) {
      return Positioned(
        top: 4,
          left: 4,
          child: IconButton(icon: const FaIcon(FontAwesomeIcons.circleXmark), onPressed: onClose));
    } else {
      return const SizedBox(
        height: 16,
        width: 0,
      );
    }
  }
}
