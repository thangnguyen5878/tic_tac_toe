import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final child;
  final foregroundColor;
  final backgroundColor;
  const CustomIconButton({super.key, this.child, this.foregroundColor, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: child,
      onPressed: () {},
      style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
          elevation: 1,
          backgroundColor: backgroundColor),
    );
  }
}
