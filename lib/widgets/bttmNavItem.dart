
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';

class BttmNavItem extends StatelessWidget {
  
  void Function() onTap;
  String iconPath;
  bool isActive;
  String text;
  bool cartCount;
  int count;

  BttmNavItem({super.key, 
    required this.onTap,
    required this.iconPath,
    required this.isActive,
    required this.text,
    this.cartCount=false,
    this.count=0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
                IconButton(
                  onPressed: onTap,
                  icon: SvgPicture.asset(
                  iconPath,
                  colorFilter: ColorFilter.mode(
                    isActive? LightAppColors.bottomNavigationActive:LightAppColors.bottomNavigationInactive, BlendMode.srcIn
                    ),
                  ),
                ),
                Visibility(
                  visible: cartCount,
                  child: Visibility(
                    visible: count>0?true:false,
                    child: Positioned(
                      top: 8,
                      right: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:isActive==true?Colors.red:const Color.fromARGB(255, 237, 77, 77),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(AppDimens.small/2),
                          child: Text(count.toString(),style: TextStyle(color: isActive==true?Colors.white:Colors.black),),
                        ),
                      ),
                    ),
                  ))
              ],
          ),
          Text(
            text,
            style: isActive? LightAppTextStyle.bttmNavActive:LightAppTextStyle.bttmNavInactive,
            )
        ],
      ),
    );
  }
}