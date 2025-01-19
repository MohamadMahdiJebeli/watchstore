import 'package:flutter/material.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/res/dimens.dart';

class CatWidget extends StatelessWidget {
  const CatWidget({
    super.key, 
    required this.title,
    required this.ontap,
    required this.colors,
    required this.iconPath,
  });

  // ignore: prefer_typing_uninitialized_variables
  final title;
  // ignore: prefer_typing_uninitialized_variables
  final ontap;
  // ignore: prefer_typing_uninitialized_variables
  final colors;
  // ignore: prefer_typing_uninitialized_variables
  final iconPath;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(AppDimens.small),
            height: size.height/12,
            width: size.height/12,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: 
                colors
                ),
                borderRadius: BorderRadius.circular(AppDimens.large)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height/14,
                  child: Image.network(iconPath,)),
              ],
            ),
          ),
          Text(title,style: LightAppTextStyle.title.copyWith(fontSize: 15),)
        ],
      ),
    );
  }
}
