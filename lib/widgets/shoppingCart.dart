
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/data/model/cart.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/screens/cart/bloc/cart_bloc.dart';
import 'package:watchstore/widgets/surfaceContainer.dart';

class ShoppingCartItem extends StatefulWidget {
  ShoppingCartItem({super.key, required this.cartModel});
  CartModel cartModel;

  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return SurfaceContainer(
        child: Row(
      children: [
        Image.network(
          widget.cartModel.image,
          height: 110,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.cartModel.product,
                style: LightAppTextStyle.productTitle.copyWith(fontSize: 12),
              ),
              Text(
                "Price : ${widget.cartModel.price.separateWithComma} تومان",
                style: LightAppTextStyle.caption,
              ),
              Visibility(
                visible: widget.cartModel.discount > 0,
                child: Text(
                  "Price for Pay : ${widget.cartModel.discountPrice.separateWithComma}  تومان",
                  style: LightAppTextStyle.caption
                      .copyWith(color: LightAppColors.primary),
                ),
              ),
              const Divider(),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() => widget.cartModel.countLoading = true);
                        cartBloc.add(
                            RemoveFromCartEvent(widget.cartModel.productId));
                      },
                      icon: SvgPicture.asset(Assets.svg.minus)),
                  widget.cartModel.countLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(),
                        )
                      : Text("${widget.cartModel.count}"),
                  IconButton(
                      onPressed: () {
                        setState(() => widget.cartModel.countLoading = true);
                        cartBloc
                            .add(AddToCartEvent(widget.cartModel.productId));
                      },
                      icon: SvgPicture.asset(Assets.svg.plus)),
                      const Expanded(child: SizedBox()),
                  IconButton(
                      onPressed: () {
                        setState(() => widget.cartModel.deleteLoading = true);
                        cartBloc
                            .add(DeleteFromCartEvent(widget.cartModel.productId));
                      },
                      icon: SvgPicture.asset(Assets.svg.delete)),
                ],
              ),
              Visibility(
                  visible: widget.cartModel.deleteLoading,
                  child: const LinearProgressIndicator())
            ],
          ),
        ),
        
      ],
    ));
  }
}