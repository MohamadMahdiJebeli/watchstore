import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/widgets/customAppBar.dart';
import 'package:watchstore/widgets/productItem.dart';
import 'package:watchstore/widgets/shoppingCart.dart';
import 'package:watchstore/widgets/surfaceContainer.dart';

class Basketscreen extends StatelessWidget {
  const Basketscreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;

    return Scaffold(
    appBar: CustomAppBar(
      child: Column(
        children: [
          (AppDimens.large*1.90).height,
          Align(
            child: Text(AppStrings.cart,style: LightAppTextStyle.title.copyWith(fontSize: 17),))
        ],
      ),),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: AppDimens.medium),
            padding: const EdgeInsets.all(AppDimens.medium),
            width: double.infinity,
            height: size.height/10,
      
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [ BoxShadow(
                color: LightAppColors.shadow,
                offset: Offset(0, 3),
                blurRadius: 3
              )]
            ),
      
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(AppStrings.address,style: LightAppTextStyle.hint,),
                      FittedBox(
                        child: Text("Isfahan"),
                      )
                    ],
                  ),
                ),
                Transform.rotate(
                  angle: -3.25,
                  child: SvgPicture.asset(Assets.svg.leftArrow))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
              return const ShoppingCart(price: 2800000,oldPrice: 2200000,count: 1, productName: "Apple Watch Series 10",);
            },)
          ),
          Container(
            height: size.height/15,
            color:Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Total: ${2800000.separateWithComma} toman"),
                IconButton(
                  onPressed: () {},
                  icon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimens.large),
                      color: LightAppColors.buy,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppDimens.large,vertical: AppDimens.small),
                      child: Text(AppStrings.buy,style: LightAppTextStyle.addToCart,),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
