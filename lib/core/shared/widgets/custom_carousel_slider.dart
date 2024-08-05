import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
    required this.items,
     this.height,
     this.autoPlay=true,
    this.onPageChanged, this.carouselController, 
    this.intialPage=0,

  });
  final List<Widget>? items;
  final CarouselController? carouselController;
  final int intialPage; 
  final double? height;
  final bool autoPlay;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items,
      carouselController: carouselController,
      options: CarouselOptions(
        autoPlay: autoPlay,
        initialPage: intialPage,
        enlargeCenterPage: true,
        reverse: false,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        animateToClosest: true,
        onPageChanged: onPageChanged,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
        scrollPhysics: const BouncingScrollPhysics(),
        enlargeFactor: 0.25,
        viewportFraction: 1,
        height: height,
      ),
    );
  }
}
