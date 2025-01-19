import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/components/extension.dart';
import 'package:watchstore/components/textStyle.dart';
import 'package:watchstore/data/repo/homeRepo.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/screens/home/bloc/home_bloc.dart';
import 'package:watchstore/screens/productList/productListScreen.dart';
import 'package:watchstore/widgets/category.dart';
import 'package:watchstore/widgets/productItem.dart';
import 'package:watchstore/widgets/searchBar.dart';
import 'package:watchstore/widgets/slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc(homeRepository);
        homeBloc.add(HomeInit());
        return homeBloc;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return SizedBox(
                  height: size.height,
                  child: const Center(
                      child: Stack(alignment: Alignment.center, children: [
                    CircularProgressIndicator(
                      strokeWidth: 4,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 0, 28, 61)),
                    ),
                    Icon(
                      Icons.watch,
                      color: Color.fromARGB(255, 0, 28, 61),
                      size: 50,
                    ),
                  ])),
                );
              } else if (state is HomeLoaded) {
                return Column(
                  children: [
                    Searchbar(
                      onTap: () {},
                    ),
                    AppDimens.medium.height,
                    AppSlider(
                      imgList: state.home.slider,
                    ),
                    (AppDimens.medium).height,
                    //Category
                    SizedBox(
                      height: size.height*0.15,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.home.category.length,
                        itemBuilder: (c,i){
                          return Padding(
                            padding: const EdgeInsets.all(AppDimens.small),
                            child: CatWidget(
                             title: state.home.category[i].title,
                             ontap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListScreen(param: state.home.category[i].id,),));
                             },
                             colors: i.isOdd?LightAppColors.digitalCategory:LightAppColors.desktopCategory,
                             iconPath: state.home.category[i].image,
                             ),
                          );
                        }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppDimens.medium),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const VerticalText(),
                            SizedBox(
                              height: size.height * 0.37,
                              child: ListView.builder(
                                  physics: const ClampingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.home.amazingProducts.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      ProductItem(product: state.home.amazingProducts[index],)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } 
              else if (state is HomeError) {
                return const Text(AppStrings.error);
              }
               else {
                return throw Exception('inavalid state');
              }
            },
          ),
        ),
      ),
    );
  }
}

class VerticalText extends StatelessWidget {
  const VerticalText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.medium),
      child: RotatedBox(
        quarterTurns: 1,
        child: Column(
          children: [
            Row(
              children: [
                const Text(AppStrings.seeAll),
                AppDimens.small.width,
                Transform.rotate(
                    angle: 1.5, child: SvgPicture.asset(Assets.svg.back)),
              ],
            ),
            AppDimens.medium.height,
            const Text(AppStrings.amazing, style: LightAppTextStyle.amazing)
          ],
        ),
      ),
    );
  }
}
