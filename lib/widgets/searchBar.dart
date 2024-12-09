
import 'package:flutter/material.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';

class Searchbar extends StatelessWidget {
  const Searchbar(
    {
    super.key,
    required this.onTap,
    }
    ); 

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
  
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(AppDimens.medium, AppDimens.large*2, AppDimens.medium, AppDimens.small),
      child: GestureDetector(
        onTap: () {
          
        },
        child: Container(
          width: double.infinity,
          height: size.height/17,
          decoration: BoxDecoration(
            color: LightAppColors.searchbar,
            borderRadius: BorderRadius.circular(AppDimens.large*2),
            boxShadow: const [
              BoxShadow(
                color: LightAppColors.shadow,
                offset: Offset(0, 3),
                blurRadius: 3,
              ),
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(Assets.png.search.path,),
              ),
              const Text(AppStrings.search,style: LightAppTextStyle.bttmNavActive,),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(width: 32,),
              )
            ],
          ),
        ),
      ),
    );
  }
}