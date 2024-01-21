import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';

// TEXT STYLES
const kTitle1 = TextStyle(
  fontFamily: 'Jomhuria',
  fontSize: 44,
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

const kNormalText = TextStyle(
  fontSize: 15,
  color: Colors.black,
);

const kBoldText = TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500);

const kSmallText = TextStyle(
  fontSize: 14,
  color: Colors.black,
);

const kSmallBoldText = TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500);

const kNormalLargeText = TextStyle(
  fontSize: 17,
  color: Colors.black,
);

const kRoundNumberBoxText = TextStyle(
  fontSize: 14,
  color: kBrown60,
);

// BOX DECORATION STYLES
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 8,
  color: Colors.black26, // Black color with 12% opacity
);

const kCardStyle = BoxDecoration(
  color: kRoomCardColor,
  borderRadius: BorderRadius.all(
    Radius.circular(4),
  ),
  boxShadow: [kDefaultShadow],
);

const kSelectedCardStyle = BoxDecoration(
  color: kSelectedRoomCardColor,
  borderRadius: BorderRadius.all(
    Radius.circular(4),
  ),
  boxShadow: [kDefaultShadow],
);

const kRoomIconStyle = BoxDecoration(
  color: kBrown30,
  borderRadius: BorderRadius.all(
    Radius.circular(4),
  ),
  // boxShadow: [kDefaultShadow],
);

final kRoundNumberBoxStyle = BoxDecoration(
  color: kBrown35.withOpacity(0.8),
  borderRadius: BorderRadius.all(
    Radius.circular(4),
  ),
);

// TEXT FIELD STYLES
InputDecoration kTextField({String labelText = "", String hintText = ""}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    labelText: labelText,
    hintText: hintText,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
