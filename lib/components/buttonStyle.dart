import 'package:flutter/material.dart';
import 'package:watchstore/res/dimens.dart';

class AppButtonstyles {
  AppButtonstyles._();

  static ButtonStyle mainButtonStyle = ButtonStyle(
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.large)))
  );
}