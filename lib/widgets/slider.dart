import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watchstore/data/model/slide.dart';
import 'package:watchstore/res/dimens.dart';



class AppSlider extends StatefulWidget {
  const AppSlider({
    super.key, 
    required this.imgList,
  });

  final List<SlideModel> imgList;

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {

  final CarouselSliderController _controller = CarouselSliderController();

    int _current = 0;

  @override
  Widget build(BuildContext context) {
  
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height/3.5,
          child: CarouselSlider(
            items: widget.imgList.map((e)=>
              Padding(
                padding: const EdgeInsets.all(AppDimens.small),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppDimens.medium),
                child: Image.network(e.image,fit: BoxFit.cover,)),
              ),
              ).toList(),
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            )
            ),
        ),
        // const SizedBox(height: AppDimens.small),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList.asMap().entries.map((e)=>
        GestureDetector(
          onTap: ()=> _controller.animateToPage(e.key),
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.small),
            child: AnimatedContainer(
              width: size.height/100,
              height: size.height/100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current==e.key?Colors.black:Colors.grey
              ), duration: const Duration(milliseconds: 100),
            ),
          ),
        )
        ).toList()
        ,)
      ],
    );
  }
}
