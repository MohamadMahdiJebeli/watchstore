import 'dart:async';

import 'package:flutter/material.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/data/model/product.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/screens/productSingle/productSingleScreen.dart';
import 'package:watchstore/utils/formatTime.dart';

class ProductItem extends StatefulWidget {
  ProductItem({
    super.key,
    required this.product,
  });

  ProductModel product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  
  late Timer _timer;
  int inSecond=0;
  
  Duration _duration = Duration(seconds: 1);

  @override
  void initState() {
    super.initState();

    _timer = Timer(_duration, (){});

    if (widget.product.specialExpiration != "") {
    DateTime now = DateTime.now();
    DateTime expiration = DateTime.parse(widget.product.specialExpiration);

    if (now.isAfter(expiration)) {
      _duration=Duration.zero;
    } else {
      _duration = now.difference(expiration);      
    }
    inSecond = _duration.inSeconds;
    startTimer();
  }
    }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductSingleScreen(id: widget.product.id)));
      },
      child: Container(
        padding: const EdgeInsets.all(AppDimens.small),
        height: size.height*0.5,
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
        child: Stack(
          children: [
            Visibility(
                  visible: widget.product.discount>0?true:false,
                  child: Container(
                    padding: const EdgeInsets.all(AppDimens.small/2.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(66),color: LightAppColors.offer,
                    ),
                    child: Text("${widget.product.discount} %"),
                  ),
            ),
            Column(
              children: [
                Image.network(widget.product.image,),
                AppDimens.medium.height,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.product.title,style: LightAppTextStyle.productTitle,)),
                  AppDimens.medium.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${widget.product.discountPrice.separateWithComma} toman",style: LightAppTextStyle.title,),
                        // AppDimens.small.height,
                        Visibility(
                          visible: widget.product.discount>0?true:false,
                          child: Text("${widget.product.price.separateWithComma} toman",style: LightAppTextStyle.oldPrice))
                      ],
                    ),
                  ],
                ),
                AppDimens.medium.height,
                Visibility(
                  visible: _duration.inSeconds>0?true:false,
                  child: Container(
                    height: 2,
                    width: double.infinity,
                    color: LightAppColors.timerOffer,
                  ),
                ),
                AppDimens.small.height,
                Visibility(
                  visible: _duration.inSeconds>0?true:false,
                  child: Text(formatType(inSecond),style: LightAppTextStyle.prodTimer,))
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer){
      setState(() {
        if(inSecond != 0){
          inSecond--;
        }
      });
    });
  }
}