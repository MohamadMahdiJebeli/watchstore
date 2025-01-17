import 'package:flutter/material.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize{
  const CustomAppBar(
    {
      super.key,
      required this.child
    }
     );

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {

    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        height: preferredSize.height,
        decoration: const BoxDecoration(
          color: LightAppColors.appBar,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppDimens.medium),
            bottomRight: Radius.circular(AppDimens.medium),
          ),
          boxShadow: [
            BoxShadow(
              color: LightAppColors.shadow,
              offset: Offset(0, 2),
              blurRadius: 3,
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
          child: child,
        ),
      )
      );
  }
    

  @override
  
  Size get preferredSize => const Size.fromHeight(80);
}