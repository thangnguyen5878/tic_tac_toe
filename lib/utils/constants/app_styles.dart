import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';

// TEXT STYLES
const kTitle1 = TextStyle(
  fontFamily: 'Jomhuria',
  fontSize: 48,
  color: Colors.black,
);

const kTitle2 = TextStyle(
  fontFamily: 'Jomhuria',
  fontSize: 40,
  color: Colors.black,
);


const kHeading1 = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

const kHeading2 = TextStyle(
  fontSize: 16,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

const kHeading3 = TextStyle(
  fontSize: 13,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);


const kNormal = TextStyle(
  fontSize: 15,
  color: Colors.black,
);

const kNormalLarge = TextStyle(
  fontSize: 17,
  color: Colors.black,
);

// BOX DECORATION STYLES
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 8,
  color: Colors.black26, // Black color with 12% opacity
);

const kCardStyle = BoxDecoration(
  color: kBrown15,
  borderRadius: BorderRadius.all(
    Radius.circular(4),
  ),
  boxShadow: [kDefaultShadow],
);

const kRoomIconStyle = BoxDecoration(
  color: kBrown40,
  borderRadius: BorderRadius.all(
    Radius.circular(4),
  ),
  // boxShadow: [kDefaultShadow],
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
