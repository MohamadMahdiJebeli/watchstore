import 'package:flutter/material.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';

ThemeData lightTheme(){
  return ThemeData(
    brightness: Brightness.light,
    iconTheme: const IconThemeData(
      color: Colors.black87
    ),
    primaryColor: LightAppColors.primary,
    scaffoldBackgroundColor: LightAppColors.background,

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: WidgetStateColor.resolveWith((states) {
        if(states.contains(WidgetState.focused)){
          return LightAppColors.focusTextField;
        } else {
          return LightAppColors.unfocusTextField;
        }
      }
    ),
    contentPadding: const EdgeInsets.all(AppDimens.medium),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimens.medium),
      borderSide: const BorderSide(
        color: LightAppColors.border
      )
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimens.medium),
      borderSide: const BorderSide(
        color: LightAppColors.focusedBorder
      )
    )
  ));
}