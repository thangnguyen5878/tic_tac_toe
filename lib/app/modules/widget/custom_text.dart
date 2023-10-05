import 'package:flutter/widgets.dart';
import 'package:flutter_tic_tac_toe/values/font_manager.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;

  const CustomText({super.key, required this.text, double? fontSize})
    : this.fontSize = fontSize ?? 16;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}
