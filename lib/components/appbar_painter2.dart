import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';

class AppBarPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = kBrown60 // paint color
      ..style = PaintingStyle.fill; // paint style

    Path path = Path() // path for the curved shape
      ..moveTo(0, 0) // move to the top left corner
      ..lineTo(size.width, 0) // draw a line to the top right corner
      ..lineTo(size.width, size.height * 0.75) // draw a line to the bottom right corner
      ..quadraticBezierTo(
          // draw a quadratic bezier curve to the bottom left corner
          size.width / 2.1,
          size.height * 0.9,
          0,
          size.height * 0.8)
      ..close(); // close the path

    canvas.drawPath(path, paint); // draw the path on the canvas
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // no need to repaint
  }
}
