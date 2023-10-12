import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'font_styles_manager.dart';
import 'size_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      //main colors of the app
      scaffoldBackgroundColor: Color.fromARGB(255, 247, 245, 245),
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.primary.withOpacity(.7),
      disabledColor: AppColors.grey,
      platform: TargetPlatform.iOS,
      splashColor: AppColors.primary.withOpacity(.7),

      //card theme for the cards
      cardTheme: CardTheme(
        color: AppColors.white,
        shadowColor: AppColors.grey,
        elevation: AppSize.size4,
        margin: const EdgeInsets.all(AppMargin.margin8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: AppSize.size4,
        iconTheme: const IconThemeData(color: AppColors.primary),
        backgroundColor: AppColors.primary,
        shadowColor: AppColors.grey1,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.primary, // Navigation bar
          statusBarColor: AppColors.primary, // Status bar
        ),
        titleTextStyle: getRegularTextStyle(
            color: AppColors.white, fontSize: AppSize.size18),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primary,
        disabledColor: AppColors.grey1,
        splashColor: AppColors.primary.withOpacity(.7),
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primary,
          textStyle: getRegularTextStyle(
            color: AppColors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textTheme: TextTheme(
          headline1: getMediumTextStyle(
              color: AppColors.darkGrey, fontSize: AppSize.size18),
          subtitle1: getMediumTextStyle(
              color: AppColors.darkGrey, fontSize: AppSize.size16),
          subtitle2: getMediumTextStyle(
              color: AppColors.darkGrey, fontSize: AppSize.size14),
          caption: getRegularTextStyle(
            color: AppColors.grey1,
          ),
          bodyText1: getRegularTextStyle(color: AppColors.grey)),
      inputDecorationTheme: InputDecorationTheme(
          //border
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.grey1),
          ),
          //hint text style
          hintStyle: getRegularTextStyle(color: AppColors.grey1),
          //focused ERROR border
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.error),
          ),
          //focused border
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.ecircular(10),
            borderSide: const BorderSid(color: AppColors.primary),
          ),
          //focused ERROR hint text style
          errorStyle: getRegularTextStyle(color: AppColors.error),
          //focused Label text style
          labelStyle: getMediumTextStyle(color: AppColors.grey),

          ///fill COLOR
          filled: true,
          fillColor: AppColors.white,
          contentPadding: const EdgeInsets.all(AppPadding.padding8)));
}
