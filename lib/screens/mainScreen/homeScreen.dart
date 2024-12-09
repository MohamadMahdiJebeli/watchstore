import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/route/names.dart';
import 'package:watchstore/screens/productListScreen.dart';
import 'package:watchstore/widgets/category.dart';
import 'package:watchstore/widgets/productItem.dart';
import 'package:watchstore/widgets/searchBar.dart';
import 'package:watchstore/widgets/slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Searchbar(onTap: (){},),
            AppDimens.medium.height,
            const AppSlider(imgList: [],),
            (AppDimens.medium).height,
            //Category
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CatWidget(
                  title: AppStrings.classic,
                  ontap: (){},
                  colors: LightAppColors.classicCategory,
                  iconPath: Assets.svg.classic
                  ),
                  CatWidget(
                  title: AppStrings.smart,
                  ontap: (){},
                  colors: LightAppColors.smartCategory,
                  iconPath: Assets.svg.smart
                  ),
                  CatWidget(
                  title: AppStrings.digital,
                  ontap: (){},
                  colors: LightAppColors.digitalCategory,
                  iconPath: Assets.svg.digital
                  ),
                  CatWidget(
                  title: AppStrings.desktop,
                  ontap: (){},
                  colors: LightAppColors.desktopCategory,
                  iconPath: Assets.svg.desktop
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimens.medium),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const VerticalText(),
                    SizedBox(
                      height: size.height*0.4,
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                          const ProductItem(name: "Apple Watch Series 10", price: 2800000,oldPrice: 2250000,offer: 20,timer: 9,)
                        ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class VerticalText extends StatelessWidget {
  const VerticalText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(AppDimens.medium),
    child: RotatedBox(
      quarterTurns: 1,
      child: Column(
        children: [
          Row(
            children: [
              const Text(AppStrings.seeAll),
              AppDimens.small.width,
              Transform.rotate(
                angle: 1.5,
                child: SvgPicture.asset(Assets.svg.back)),
            ],
          ),
          AppDimens.medium.height,
          const Text(AppStrings.amazing,style: LightAppTextStyle.amazing)
        ],
      ),
    ),
    );
  }
}