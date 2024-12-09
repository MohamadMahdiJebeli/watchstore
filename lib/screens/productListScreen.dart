import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/widgets/CartBadge.dart';
import 'package:watchstore/widgets/customAppBar.dart';
import 'package:watchstore/widgets/productItem.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        child: Column(
          children: [
            (AppDimens.large*1.12).height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CartBadge(count: 1,),
                Row(
                  children: [
                    const Text('Product List'),
                    AppDimens.small.width,
                    const Icon(Icons.sort),
                  ],
                ),
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.close)
                  )
              ],
            ),
          ],
        )
        ),
      body: const Column(
        children: [
          TagList(),
          ProductGridView()
        ],
      )
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    
    Size size  = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.medium),
      child: SizedBox(
        height: size.height/30,
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
                  padding: EdgeInsets.fromLTRB(AppDimens.small, 0, AppDimens.small, 0),
                  child: Text("New Force",style: LightAppTextStyle.tagTitle,),
                )),
            );
          },),
      ),
    );
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 30,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 0.6
          ),
          itemBuilder: (context, index) => const ProductItem(name: "Apple Watch Series 10", price: 2800000),));
  }
}