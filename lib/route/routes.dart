
import 'package:flutter/cupertino.dart';
import 'package:watchstore/route/names.dart';
import 'package:watchstore/screens/getOTP_screen.dart';
import 'package:watchstore/screens/mainScreen/mainScreen.dart';
import 'package:watchstore/screens/productListScreen.dart';
import 'package:watchstore/screens/productSingleScreen.dart';
import 'package:watchstore/screens/registerScreen.dart';
import 'package:watchstore/screens/sendOTP_Screen.dart';

Map<String,Widget Function(BuildContext)> routes={
  ScreenNames.root : (context) => SendOTPScreen(),
  ScreenNames.getOTPScreen : (context) => GetOTPScreen(),
  ScreenNames.registerScreen : (context) => Registerscreen(),
  ScreenNames.mainScreen : (context) => Mainscreen(),
  ScreenNames.productListScreen : (context) => const ProductListScreen(),
  ScreenNames.producSingleScreen : (context) => const ProductSingleScreen(),
};