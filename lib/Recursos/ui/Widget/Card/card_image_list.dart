import 'package:app_turismo_usuario/Recursos/ui/Widget/Card/card_image.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CardImageList extends StatefulWidget {
  final List imageList;
  final bool radiusBottom;

  const CardImageList({super.key, required this.imageList, this.radiusBottom = true});

  @override
  State<CardImageList> createState() => _CardImageListState();
}

class _CardImageListState extends State<CardImageList> {
  final PageController _pageController = PageController();
  
  int currentIndex = 0;
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentIndex = _pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.imageList.isEmpty){
      return const SizedBox();
    }

    return SizedBox(
      height: 282.0,
      child: Stack(children: [
        PageView.builder(
            controller: _pageController,
            itemCount: widget.imageList.length,
            itemBuilder: ((context, index) {
              return CardImage(
                widget.imageList[index],
                key: UniqueKey(),
                radiusBottom: widget.radiusBottom,
              );
            })),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: widget.imageList.length,
                effect: const WormEffect(
                    activeDotColor: AppBasicColors.rgb,
                    dotColor: AppBasicColors.lightGrey,
                    dotHeight: 9,
                    dotWidth: 9),
                /* onDotClicked: ((index) {
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
            }),*/
              ),
            ))
      ]),
    );
  }
}
