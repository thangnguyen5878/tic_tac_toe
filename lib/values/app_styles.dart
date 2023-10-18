import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/values/app_fonts.dart';

class AppStyles {
  static const heading1 =
      TextStyle(fontSize: 48, color: Colors.black, fontFamily: 'Jomhuria');
  static const heading2 = TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static const normal = TextStyle(
    fontSize: 15,
    color: Colors.black,
  );

  static const customListTile = ShapeDecoration(
    color: Color(0xFFF0E5E5),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))),
  );
}
