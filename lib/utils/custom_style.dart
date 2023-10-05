import 'package:flutter/material.dart';

class CustomStyle {
  static InputDecoration textField(
      {String labelText = "", String hintText = ""}) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      labelText: labelText,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
