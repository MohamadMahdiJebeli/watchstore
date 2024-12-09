import 'package:flutter/material.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';

class SinglePrice extends StatelessWidget {
  const SinglePrice({
    super.key, 
    required this.price, 
    this.oldPrice=0,
    this.offer=0
    });

  final int price;
  final int oldPrice;
  final offer;

  @override
  Widget build(BuildContext context) {
    return  
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${price.separateWithComma} toman",style: LightAppTextStyle.title.copyWith(fontWeight: FontWeight.bold,fontSize: 16),),
                    // AppDimens.small.height,
                    Visibility(
                      visible: offer>0?true:false,
                      child: Text("${oldPrice.separateWithComma} toman",style: LightAppTextStyle.oldPrice))
                  ],
                ),
                Visibility(
                  visible: offer>0?true:false,
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimens.small),
                    child: Container(
                      padding: const EdgeInsets.all(AppDimens.small/2.1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(66),color: LightAppColors.offer,
                      ),
                      child: Text("$offer %",style: LightAppTextStyle.offer.copyWith(color: Colors.black),),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}