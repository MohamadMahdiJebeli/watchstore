import 'package:flutter/material.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/dimens.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.onTap,
    required this.file
    });

  final onTap;
  final file;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: size.width*0.25,
            height: size.width*0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100000),
              child: file == null ? Image.asset(Assets.png.user.path,scale: 5,):Image.file(file),
            ),
          ),
          AppDimens.medium.height,
          const Text(AppStrings.chooseProfileImage)
        ],
      ),
    );
  }
}