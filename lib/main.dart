import 'package:flutter/material.dart';
import 'package:watchstore/components/theme.dart';
import 'package:watchstore/route/names.dart';
import 'package:watchstore/route/routes.dart';
import 'package:watchstore/screens/mainScreen/mainScreen.dart';
import 'package:watchstore/screens/productListScreen.dart';
import 'package:watchstore/screens/productSingleScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watch Store',
      theme: lightTheme(),
      initialRoute: ScreenNames.root,
      routes: routes,
      // home: Mainscreen(),
    );
  }
}
