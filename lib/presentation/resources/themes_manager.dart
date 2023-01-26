import 'package:flutter/material.dart';
import 'package:pace_assignment/presentation/resources/color_manager.dart';
import 'package:pace_assignment/presentation/resources/font_manager.dart';
import 'package:pace_assignment/presentation/resources/style_manager.dart';
import 'package:pace_assignment/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  final theme = ThemeData(
    primaryColor: ColorManager.black,

    //app bar theme

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.black,
      elevation: AppSize.s4,
      titleTextStyle:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s29),
    ),

    //Text theme

    textTheme: TextTheme(
      headline1:
          getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s29),
      subtitle1:
          getMediumStyle(color: ColorManager.halfWhite, fontSize: FontSize.s20),
      subtitle2:
          getMediumStyle(color: ColorManager.lightGray, fontSize: FontSize.s12),
      caption: getRegularStyle(
          color: ColorManager.halfWhite, fontSize: FontSize.s29),
      bodyText1: getRegularStyle(
          color: ColorManager.lightGray, fontSize: FontSize.s14),
      headline6: getRegularStyle(
          color: ColorManager.halfWhite, fontSize: FontSize.s20),
    ),
  );

  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(secondary: ColorManager.gray),
  );
}
