// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'app_colors.dart';
// import 'font_styles_manager.dart';
// import 'size_manager.dart';

// ThemeData getApplicationTheme() {
//   return ThemeData(
//       //main colors of the app
//       scaffoldBackgroundColor: Color.fromARGB(255, 247, 245, 245),
//       primaryColor: primary,
//       primaryColorLight: primary.withOpacity(.7),
//       disabledColor: grey45,
//       platform: TargetPlatform.iOS,
//       splashColor: primary.withOpacity(.7),

//       //card theme for the cards
//       cardTheme: CardTheme(
//         color: white,
//         shadowColor: grey45,
//         elevation: AppSize.size4,
//         margin: const EdgeInsets.all(AppMargin.margin8),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       appBarTheme: AppBarTheme(
//         elevation: AppSize.size4,
//         iconTheme: const IconThemeData(color: primary),
//         backgroundColor: primary,
//         shadowColor: grey1,
//         systemOverlayStyle: const SystemUiOverlayStyle(
//           systemNavigationBarIconBrightness: Brightness.dark,
//           statusBarIconBrightness: Brightness.dark,
//           systemNavigationBarColor: primary, // Navigation bar
//           statusBarColor: primary, // Status bar
//         ),
//         titleTextStyle: getRegularTextStyle(
//             color: white, fontSize: AppSize.size18),
//       ),
//       buttonTheme: ButtonThemeData(
//         buttonColor: primary,
//         disabledColor: grey1,
//         splashColor: primary.withOpacity(.7),
//         textTheme: ButtonTextTheme.primary,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           primary: primary,
//           textStyle: getRegularTextStyle(
//             color: white,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),
//       textTheme: TextTheme(
//           headline1: getMediumTextStyle(
//               color: darkGrey, fontSize: AppSize.size18),
//           subtitle1: getMediumTextStyle(
//               color: darkGrey, fontSize: AppSize.size16),
//           subtitle2: getMediumTextStyle(
//               color: darkGrey, fontSize: AppSize.size14),
//           caption: getRegularTextStyle(
//             color: grey1,
//           ),
//           bodyText1: getRegularTextStyle(color: grey45)),
//       inputDecorationTheme: InputDecorationTheme(
//           //border
//           border: UnderlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(color: grey1),
//           ),
//           //hint text style
//           hintStyle: getRegularTextStyle(color: grey1),
//           //focused ERROR border
//           errorBorder: UnderlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(color: error),
//           ),
//           //focused border
//           focusedBorder: UnderlineInputBorder(
//             borderRadius: BorderRadius.ecircular(10),
//             borderSide: const BorderSid(color: primary),
//           ),
//           //focused ERROR hint text style
//           errorStyle: getRegularTextStyle(color: error),
//           //focused Label text style
//           labelStyle: getMediumTextStyle(color: grey45),

//           ///fill COLOR
//           filled: true,
//           fillColor: white,
//           contentPadding: const EdgeInsets.all(AppPadding.padding8)));
// }
