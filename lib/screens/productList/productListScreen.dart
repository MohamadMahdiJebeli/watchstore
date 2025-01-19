import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/data/repo/cartRepo.dart';
import 'package:watchstore/data/repo/productRepo.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/screens/productList/bloc/product_list_bloc.dart';
import 'package:watchstore/widgets/CartBadge.dart';
import 'package:watchstore/widgets/customAppBar.dart';
import 'package:watchstore/widgets/productItem.dart';

class ProductListScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final param;
  const ProductListScreen({super.key, this.param});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {

        final productListBloc = ProductListBloc(productRepository);
        productListBloc.add(ProductListInit(param: param));

        return productListBloc;
      },
      child: Scaffold(
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
                  Row(
                    children: [
                      const Text('Product List'),
                      AppDimens.small.width,
                      const Icon(Icons.sort),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close))
                ],
              ),
            ],
          )),
          body: Column(
            children: [const TagList(),
            BlocBuilder<ProductListBloc, ProductListState>(
              builder: (context, state) {
                if (state is ProductListLoading) {
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
                } else if (state is ProductListLoaded) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: state.productList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                          childAspectRatio: 0.58),
                      itemBuilder: (context, index) => ProductItem(product: state.productList[index],),
                ));
                } else if(state is ProductListError){
                  return const Expanded(child: Center(child: Text(AppStrings.error)));
                } else {
                  throw Exception("invalid state");
                }
              },
            )
             ],
          )),
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.medium),
      child: SizedBox(
        height: size.height / 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, i) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: AppDimens.small),
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.small),
              decoration: BoxDecoration(
                color: LightAppColors.tags,
                borderRadius: BorderRadius.circular(AppDimens.large),
              ),
              child: const Center(
                  child: Padding(
                padding:
                    EdgeInsets.fromLTRB(AppDimens.small, 0, AppDimens.small, 0),
                child: Text(
                  "New Force",
                  style: LightAppTextStyle.tagTitle,
                ),
              )),
            );
          },
        ),
      ),
    );
  }
}
