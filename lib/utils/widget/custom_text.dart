import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;

  const CustomText({super.key, required this.text, double? fontSize})
    : fontSize = fontSize ?? 16;

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
