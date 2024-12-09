import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/dimens.dart';

class RegistrationAppBar extends StatelessWidget implements PreferredSizeWidget{
  const RegistrationAppBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(size.width, size.height*0.3),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(AppDimens.medium,AppDimens.large*2,AppDimens.medium,0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: ()=> Navigator.pop(context),
              child: SvgPicture.asset(Assets.svg.leftArrow)
            ),
            const Text(AppStrings.signUp,style: LightAppTextStyle.title,),
            SizedBox(width: size.width*0.05,),
          ],
        ),
      )
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size.height*0.3);
}