import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/data/model/productDetails.dart';
import 'package:watchstore/data/repo/cartRepo.dart';
import 'package:watchstore/data/repo/productRepo.dart';
import 'package:watchstore/gen/fonts.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/screens/cart/bloc/cart_bloc.dart';
import 'package:watchstore/screens/productSingle/bloc/product_single_bloc.dart';
import 'package:watchstore/screens/productSingle/bloc/product_single_event.dart';
import 'package:watchstore/widgets/CartBadge.dart';
import 'package:watchstore/widgets/customAppBar.dart';
import 'package:watchstore/widgets/singlePrice.dart';

class ProductSingleScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final id;
  const ProductSingleScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  BlocProvider(
          create: (context) {
            final productSingleBloc = ProductSingleBloc(productRepository);
            productSingleBloc.add(ProductSingleInit(id: id));
            return productSingleBloc;
          },              
          child: BlocBuilder<ProductSingleBloc, ProductSingleState>(
            builder: (context, state) {
              if (state is ProductSingleLoading) {
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
              } else if(state is ProductSingleLoaded){
                return Scaffold(
                appBar: CustomAppBar(
                    child: Column(
                  children: [
                    (AppDimens.large * 1.12).height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: cartRepository.cartCount,
                          builder: (context, value, child) {
                            return CartBadge(
                              count: value,
                            );
                          },),
                        FittedBox(
                          child: Text(
                            state.productDetailes.title??"No Name",
                            style: LightAppTextStyle.productTitle,
                          ),
                        ),
                        IconButton(
                          onPressed: ()=> Navigator.pop(context) ,
                          icon: const Icon(Icons.close))
                      ],
                    ),
                  ],
                )),
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.network(
                            state.productDetailes.image!,
                            fit: BoxFit.cover,
                            width: size.width,
                          ),
                          Container(
                            width: size.width,
                            margin: const EdgeInsets.all(AppDimens.medium),
                            padding: const EdgeInsets.all(AppDimens.medium),
                            decoration: BoxDecoration(
                                color: LightAppColors.singleProductBG,
                                borderRadius:
                                    BorderRadius.circular(AppDimens.medium)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.productDetailes.brand!,
                                  style: LightAppTextStyle.productTitle,
                                ),
                                Text(
                                  state.productDetailes.title!,
                                  style: LightAppTextStyle.caption,
                                ),
                                const Divider(),
                                ProductTabView(productDetailesModel: state.productDetailes,),
                                SizedBox(
                                  height: size.height * 0.05,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: size.height * 0.02,
                      right: size.width * 0.075,
                      left: size.width * 0.075,
                      child: Container(
                        height: size.height / 15,
                        width: size.width * .85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDimens.small),
                          color: LightAppColors.addToCartNav,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(AppDimens.small),
                              child: SinglePrice(
                                price: state.productDetailes.discountPrice??0,
                                oldPrice: state.productDetailes.price??0,
                                offer: state.productDetailes.discount??0,
                              ),
                            ),
                            BlocConsumer<CartBloc, CartState>(
                              listener: (cartContext, cartState) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  duration: const Duration(seconds: 1),
                                  backgroundColor: LightAppColors.success,
                                  content: Text(AppStrings.addedToCart,style: LightAppTextStyle.caption.copyWith(color: LightAppColors.unSuccess),)));
                              },
                              builder: (cartContext, cartState) {
                               
                                if (cartState is CartLoadingState) {
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
                                }
                                return GestureDetector(
                                  onTap: (){
                                    BlocProvider.of<CartBloc>(context).add(AddToCartEvent(state.productDetailes.id!));
                                  },
                                  child: Padding(
                                                            padding: const EdgeInsets.all(AppDimens.small),
                                                            child: Container(
                                                              width: size.width * 0.28,
                                                              height: size.height / 18,
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(AppDimens.small),
                                                                color: LightAppColors.addToCart,
                                                              ),
                                                              child: const Center(
                                                                  child: Text(
                                                                AppStrings.addToCart,
                                                                style: LightAppTextStyle.addToCart,
                                                              )),
                                                            ),
                                                          ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
              } else if(state is ProductSingleError){
                return const Text(AppStrings.error);
              } else{
                throw Exception("invalid");
              }
            },
          ),
    );
  }
}

class ProductTabView extends StatefulWidget {
  
  final ProductDetailesModel productDetailesModel;
  const ProductTabView({super.key, required this.productDetailesModel});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  var selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height / 22,
          width: size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: AppStrings.singleTabs.length,
            itemExtent: size.width * 0.70,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => setState(() => selectedTabIndex = index),
              child: Container(
                padding: const EdgeInsets.all(AppDimens.medium),
                child: Text(
                  AppStrings.singleTabs[index],
                  style: index == selectedTabIndex
                      ? LightAppTextStyle.bttmNavActive.copyWith(fontSize: 15)
                      : LightAppTextStyle.bttmNavInactive,
                ),
              ),
            ),
          ),
        ),
        IndexedStack(
          index: selectedTabIndex,
          children: [
            Features(properties:widget.productDetailesModel.properties!),
            Review(text: widget.productDetailesModel.description,),
          ],
        )
      ],
    );
  }
}

class Features extends StatelessWidget {

  final List<Properties> properties;
  const Features({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: properties.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppDimens.medium),
          margin: const EdgeInsets.all(AppDimens.medium),
          decoration: BoxDecoration(
            color: LightAppColors.surface,
            borderRadius: BorderRadius.circular(AppDimens.medium),
          ),
          child: Center(
            child: Text("${properties[index].value}   :      ${properties[index].property}",style: LightAppTextStyle.caption,)),
        );
      },
      );
  }
}

class Review extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final text;
  const Review({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.small),
      child: HtmlWidget(text,textStyle: const TextStyle(fontFamily: FontFamily.dana),));
  }
}
