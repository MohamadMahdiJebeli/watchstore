
import 'package:flutter/cupertino.dart';
import 'package:watchstore/route/names.dart';
import 'package:watchstore/screens/auth/sendSMS_Screen.dart';
import 'package:watchstore/screens/auth/verifyCodeScreen.dart';
import 'package:watchstore/screens/mainScreen/mainScreen.dart';
import 'package:watchstore/screens/productList/productListScreen.dart';
import 'package:watchstore/screens/productSingle/productSingleScreen.dart';
import 'package:watchstore/screens/register/registerScreen.dart';

Map<String,Widget Function(BuildContext)> routes={
  ScreenNames.sendSMSScreen : (context) => SendSMS_Screen(),
  ScreenNames.verifyCodeScreen : (context) => const VerifyCodeScreen(),
  ScreenNames.registerScreen : (context) => const Registerscreen(),
  ScreenNames.mainScreen : (context) => Mainscreen(),
  ScreenNames.productListScreen : (context) => const ProductListScreen(),
  ScreenNames.producSingleScreen : (context) => const ProductSingleScreen(),
};