import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> children;
  bool? hasCloseIconButton = false;
  VoidCallback? onBackPress = () {};

  CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.children,
    this.hasCloseIconButton,
    this.onBackPress,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        onBackPress!();
      },
      child: Dialog(
        child: Stack(children: [
          _buildCloseIconButton(),
          _buildDialogBody(),
        ]),
      ),
    );
  }

  Widget _buildDialogBody() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
          child:
              IconButton(icon: const FaIcon(FontAwesomeIcons.circleXmark), onPressed: onBackPress));
    } else {
      return const SizedBox(
        height: 16,
        width: 0,
      );
    }
  }
}
