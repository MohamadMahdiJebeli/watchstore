import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/data/model/cart.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/screens/cart/bloc/cart_bloc.dart';
import 'package:watchstore/widgets/customAppBar.dart';
import 'package:watchstore/widgets/productItem.dart';
import 'package:watchstore/widgets/shoppingCart.dart';
import 'package:watchstore/widgets/surfaceContainer.dart';
import 'package:url_launcher/url_launcher.dart';

class Basketscreen extends StatelessWidget {
  const Basketscreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context).add(CartInitEvent());
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        child: Column(
          children: [
            (AppDimens.large * 1.90).height,
            Align(
                child: Text(
              AppStrings.cart,
              style: LightAppTextStyle.title.copyWith(fontSize: 17),
            ))
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: AppDimens.medium),
            padding: const EdgeInsets.all(AppDimens.medium),
            width: double.infinity,
            height: size.height / 10,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: LightAppColors.shadow,
                  offset: Offset(0, 3),
                  blurRadius: 3)
            ]),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        AppStrings.address,
                        style: LightAppTextStyle.hint,
                      ),
                      FittedBox(
                        child: Text("Isfahan"),
                      )
                    ],
                  ),
                ),
                Transform.rotate(
                    angle: -3.25, child: SvgPicture.asset(Assets.svg.leftArrow))
              ],
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoadedState) {
                return CartList(list: state.userCart.cartList);
              } else if(state is CartItemAddState){
                return CartList(list: state.userCart.cartList);
              } else if(state is CartItemRemoveState){
                return CartList(list: state.userCart.cartList);
              } else if (state is CartErrorState){
                return const Text(AppStrings.error);
              } else if(state is CartLoadingState){
                return const Center(
                        child: Stack(alignment: Alignment.center, children: [
                      CircularProgressIndicator(
                        strokeWidth: 4,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(LightAppColors.primary),
                      ),
                      Icon(
                        Icons.watch,
                        color: LightAppColors.primary,
                        size: 50,
                      ),
                    ]));
              } else {
                return const SizedBox(height: 10,);
              }
            },
          ),
          BlocConsumer<CartBloc,CartState>(
            builder: (context, state) {
              UserCart? userCart;

              switch (state.runtimeType) {
                case CartLoadedState:
                case CartItemAddState:
                case CartItemDeleteState:
                case CartItemRemoveState:
                  userCart = (state as dynamic).userCart;
                  break;
                case CartErrorState:
                  return const Text(AppStrings.error);
                case CartLoadingState:
                  return const Center(
                        child: Stack(alignment: Alignment.center, children: [
                      CircularProgressIndicator(
                        strokeWidth: 4,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(LightAppColors.primary),
                      ),
                      Icon(
                        Icons.watch,
                        color: LightAppColors.primary,
                        size: 50,
                      ),
                    ]));
                default: const SizedBox();}
                return Visibility(
                  visible: (userCart?.cartTotalPrice??0)>0,
                  child: 
                  Container(
                  height: size.height / 15,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Visibility(
                            visible: userCart?.totalWithoutDiscountPrice != userCart?.cartTotalPrice,
                            child: Text("Total: ${userCart?.totalWithoutDiscountPrice.separateWithComma} toman",style: LightAppTextStyle.caption,)),
                          Text("Total For Pay : ${userCart?.cartTotalPrice.separateWithComma} toman")
                        ],
                      ),
                      IconButton(
                        onPressed: () => BlocProvider.of<CartBloc>(context).add(CartPayEvent()),
                        icon: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppDimens.large),
                            color: LightAppColors.buy,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppDimens.large,
                                vertical: AppDimens.small),
                            child: Text(
                              AppStrings.buy,
                              style: LightAppTextStyle.addToCart,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ) 
                  );
            },
            listener: (context,state) async {
              if (state is RecivedPayLinkState) {
                final Uri url = Uri.parse(state.url);

                if (!await launchUrl(url)) {
                  throw Exception("Couldn't luanch $url");
                }
              }
            }
            )
          
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  List<CartModel> list;

  CartList({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ShoppingCartItem(

          cartModel: list[index],
          );
      },
    ));
  }
}
