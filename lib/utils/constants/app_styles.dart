import 'package:flutter/material.dart';

// TEXT STYLES
const kHeading1 = TextStyle(
  fontFamily: 'Jomhuria',
  fontSize: 48,
  color: Colors.black,
);

const kHeading2 = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

const kNormal = TextStyle(
  fontSize: 15,
  color: Colors.black,
);

// BOX DECORATION STYLES
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);

// TEXT FIELD STYLES
InputDecoration kTextField({String labelText = "", String hintText = ""}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 10),
    labelText: labelText,
    hintText: hintText,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
