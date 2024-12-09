
import 'package:flutter/material.dart';
import 'package:watchstore/gen/fonts.gen.dart';
import 'package:watchstore/res/colors.dart';

class LightAppTextStyle{
  LightAppTextStyle._();

  static const TextStyle title = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: LightAppColors.title,
  );
  static const TextStyle hint = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: LightAppColors.hint,
  );
  static const TextStyle bttmNavActive = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: LightAppColors.bottomNavigationActive,
  );
  static const TextStyle bttmNavInactive = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: LightAppColors.bottomNavigationInactive,
  );
  static const TextStyle productTitle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: LightAppColors.title,
  );  
  static const TextStyle oldPrice = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: LightAppColors.oldPrice,
    decoration: TextDecoration.lineThrough
  );  
  static const TextStyle prodTimer = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: LightAppColors.timerOffer,
  );  
  static const TextStyle amazing = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: LightAppColors.amazing,
  );  
  static const TextStyle tagTitle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: LightAppColors.tagTitle,
  );
  static TextStyle caption = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: LightAppColors.caption,
  );
  static const TextStyle offer = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle addToCart = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle avatarName = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}