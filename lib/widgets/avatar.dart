import 'package:flutter/material.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/dimens.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100000),
          child: Image.asset(Assets.png.user.path,scale: 5,),
        ),
        AppDimens.medium.height,
        const Text(AppStrings.chooseProfileImage)
      ],
    );
  }
}