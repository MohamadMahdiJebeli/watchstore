import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/screens/mainScreen/basketScreen.dart';
import 'package:watchstore/screens/mainScreen/homeScreen.dart';
import 'package:watchstore/screens/mainScreen/profileScreen.dart';
import 'package:watchstore/widgets/bttmNavItem.dart';

class BttmNavScreenIndex{
  BttmNavScreenIndex._();

  static const home = 0;
  static const basket = 1;
  static const profile = 2;
}

class Mainscreen extends StatefulWidget {
  Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  
  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _basketKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  int selectedIndex = 0;

  late final map = {
    BttmNavScreenIndex.home: _homeKey,
    BttmNavScreenIndex.basket: _basketKey,
    BttmNavScreenIndex.profile: _profileKey,
  };

  Future<bool> _onWillPop() async{
    if (map[selectedIndex]!.currentState!.canPop()) {
      map[selectedIndex]!.currentState!.pop();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;
    double bttmNavHeight = size.height*0.08;

    return WillPopScope.new(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: bttmNavHeight,
              child: IndexedStack(
                index: selectedIndex,
                children: [
                  Navigator(
                    key: _homeKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(builder: (context)=> const HomeScreen()),
                  ),
                  Navigator(
                    key: _basketKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(builder: (context)=> const Basketscreen()),
                  ),
                  Navigator(
                    key: _profileKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(builder: (context)=> const Profilescreen()),
                  ),
                ]
              )
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: LightAppColors.bottomNavigation,
                  height: bttmNavHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BttmNavItem(
                        onTap: ()=>bttmNavOnPressed(index: BttmNavScreenIndex.home),
                        iconPath: Assets.svg.home,
                        isActive: selectedIndex==BttmNavScreenIndex.home,
                        text: AppStrings.home,
                        ),
                        BttmNavItem(
                        onTap: ()=>bttmNavOnPressed(index: BttmNavScreenIndex.basket),
                        iconPath: Assets.svg.cart,
                        isActive: selectedIndex==BttmNavScreenIndex.basket,
                        text: AppStrings.cart,
                        cartCount: true,
                        count: 1,
                        ),
                        BttmNavItem(
                        onTap: ()=>bttmNavOnPressed(index: BttmNavScreenIndex.profile),
                        iconPath: Assets.svg.user,
                        isActive: selectedIndex==BttmNavScreenIndex.profile,
                        text: AppStrings.profile,
                        )
                    ],
                  ),
                ),
                )
          ],
        ),
      ),
    );
  }
  bttmNavOnPressed({required index}){
  setState((){
    selectedIndex = index;
  });
}
}

