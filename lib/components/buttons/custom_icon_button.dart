import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final Color foregroundColor;
  final Color backgroundColor;
  const CustomIconButton(
      {super.key,
      required this.child,
      required this.foregroundColor,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          foregroundColor: foregroundColor, elevation: 1, backgroundColor: backgroundColor),
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('child', child));
  }
}
