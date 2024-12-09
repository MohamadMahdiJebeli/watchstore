import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/dimens.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({
    super.key,
    this.count = 0
    });

  final count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(Assets.svg.cart,colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),),
        Visibility(
          visible: count>0?true:false,
          child: Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(AppDimens.small*0.5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Text(count.toString(),style: const TextStyle(color: Colors.white),),
            ),
          )
          )
      ]
    );
  }
}