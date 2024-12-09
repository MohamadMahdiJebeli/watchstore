
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/widgets/surfaceContainer.dart';

class ShoppingCart extends StatelessWidget{
  const ShoppingCart({
    super.key,
    this.oldPrice=0,
    required this.price,
    this.count=0,
    required this.productName
    });

  final int oldPrice;
  final int price;
  final int count;
  final String productName;


  @override
  Widget build(BuildContext context) {
  
    Size size = MediaQuery.of(context).size;

    return SurfaceContainer(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimens.small),
            child: Image.asset(Assets.png.appleWatchSeries10.path,height: size.height/8,),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productName, style: LightAppTextStyle.productTitle),
              Text("${oldPrice.separateWithComma} toman",style: LightAppTextStyle.caption,),
              Text("Final Price: ${price.separateWithComma} toman",style: LightAppTextStyle.caption.copyWith(color: LightAppColors.primary),),
              AppDimens.small.height,
              Container(
                color: LightAppColors.border,
                height: 2,
                width: size.width*0.55,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: (){

                    },
                    icon: SvgPicture.asset(Assets.svg.minus)),
                  Text(count.toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                  IconButton(
                    onPressed: (){
                    },
                    icon: SvgPicture.asset(Assets.svg.plus)),
                  SizedBox(width: size.width*0.2,),
                  IconButton(
                    onPressed: (){},
                    icon: SvgPicture.asset(Assets.svg.delete)),
                ],
              )
            ],
          )
        ],
      ),
      );
  }
}