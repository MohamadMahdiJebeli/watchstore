import 'package:flutter/material.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.name,
    required this.price,
    this.oldPrice=0,
    this.offer=0,
    this.timer=0,
  });

  final name;
  final int price;
  final int oldPrice;
  final offer;
  final timer;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(AppDimens.small),
      height: size.height*0.29,
      width: size.width*0.4,
      margin: const EdgeInsets.all(AppDimens.medium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.medium),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: LightAppColors.productBG
          ),
      ),
      child: Column(
        children: [
          Image.asset(Assets.png.appleWatchSeries10.path),
          AppDimens.medium.height,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(name,style: LightAppTextStyle.productTitle,)),
            AppDimens.medium.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${price.separateWithComma} toman",style: LightAppTextStyle.title,),
                  // AppDimens.small.height,
                  Visibility(
                    visible: offer>0?true:false,
                    child: Text("${oldPrice.separateWithComma} toman",style: LightAppTextStyle.oldPrice))
                ],
              ),
              Visibility(
                visible: offer>0?true:false,
                child: Container(
                  padding: const EdgeInsets.all(AppDimens.small/2.1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(66),color: LightAppColors.offer,
                  ),
                  child: Text("$offer %"),
                ),
              )
            ],
          ),
          AppDimens.large.height,
          Visibility(
            visible: timer>0?true:false,
            child: Container(
              height: 2,
              width: double.infinity,
              color: LightAppColors.timerOffer,
            ),
          ),
          AppDimens.small.height,
          Visibility(
            visible: timer>0?true:false,
            child: Text("$timer",style: LightAppTextStyle.prodTimer,))
        ],
      ),
    );
  }
}