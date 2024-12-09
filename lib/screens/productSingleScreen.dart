import 'package:flutter/material.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/widgets/CartBadge.dart';
import 'package:watchstore/widgets/customAppBar.dart';
import 'package:watchstore/widgets/singlePrice.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        child: Column(
          children: [
            (AppDimens.large*1.12).height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CartBadge(count: 1,),
                const Text('Apple Watch Serie 10',style: LightAppTextStyle.productTitle,),
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.close)
                  )
              ],
            ),
          ],
        )),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset((Assets.png.appleWatchSeries10.path),fit: BoxFit.cover,width: size.width,),
                  Container(
                    width: size.width,
                    margin: const EdgeInsets.all(AppDimens.medium),
                    padding: const EdgeInsets.all(AppDimens.medium),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(AppDimens.medium)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Apple Watch Series 10",style: LightAppTextStyle.productTitle,),
                        Text("Thinstant classic",style: LightAppTextStyle.caption,),
                        const Divider(),
                        const ProductTabView(),
                        SizedBox(height: size.height*0.05,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: size.height*0.02,
              right: size.width*0.075,
              left: size.width*0.075,
              child: Container(
                height: size.height/15,
                width: size.width*.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimens.small),
                  color: LightAppColors.addToCartNav,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(AppDimens.small),
                      child: SinglePrice(price: 2800,oldPrice: 2200,offer: 20,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppDimens.small),
                      child: Container(
                        width: size.width*0.28,
                        height: size.height/18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDimens.small),
                          color: LightAppColors.addToCart,
                        ),
                        child: const Center(child: Text(AppStrings.addToCart,style: LightAppTextStyle.addToCart,)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {

  var selectedTabIndex=0;

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height/22,
          width: size.width,
        
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: AppStrings.singleTabs.length,
            itemExtent: size.width*0.70,
        
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => setState(() =>selectedTabIndex=index),
              child: Container(
                padding: const EdgeInsets.all(AppDimens.medium),
                child: Text(AppStrings.singleTabs[index],style: index==selectedTabIndex ? LightAppTextStyle.bttmNavActive.copyWith(fontSize: 15):LightAppTextStyle.bttmNavInactive,),
              ),
            ),),
        ),
        IndexedStack(
          index: selectedTabIndex,

          children: const [
            Features(),
            Review(),
          ],
        )
      ],
    );
  }
}

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppDimens.small),
      child: Text("46mm or 42mm aluminium or titanium case Wide-angle Always-On Retina display Up to 2,000 nits Up to 40% brighter when viewed at an angle S10 SiP Double tap gesture Faster on-device Siri Precision Finding for iPhone15 ECG app5 High and low heart rate notifications Irregular rhythm notifications6 Low cardio fitness notifications Blood Oxygen app22 Sleep apnoea notifications3 Up to 18 hours20 Up to 36 hours in Low Power Mode20 Fast Charging2"),
    );
  }
}

class Review extends StatelessWidget {
  const Review ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppDimens.small),
      child: Text("Smarts that stack up. The Smart Stack automatically shows relevant information throughout the day based on time, location and more. Like if rain is coming. Live Activities can keep you updated on things like sports scores or your upcoming flight. Words travel fast. The new Translate app automatically adds a widget to your Smart Stack when you’re travelling somewhere a different language is spoken. You can even download languages to your watch so you can use Translate without your iPhone, Wi‑Fi or a mobile data connection.13 Go without your phone. Take a call from the trail. Return a text on your run. Cellular lets you leave your phone behind without missing a beat.12"),
    );
  }
}