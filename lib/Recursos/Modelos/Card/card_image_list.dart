import 'package:app_turismo_usuario/Recursos/Modelos/Card/card_image.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CardImageList extends StatefulWidget {
  const CardImageList({super.key});

  @override
  State<CardImageList> createState() => _CardImageListState();
}

class _CardImageListState extends State<CardImageList> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  List<CardImage> imageList = <CardImage>[
    CardImage('Assets/Img/Helenita.jpeg'),
    CardImage('Assets/Img/Helenita.jpeg'),
    CardImage('Assets/Img/Helenita.jpeg'),
    CardImage('Assets/Img/Helenita.jpeg')
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
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
    return SizedBox(
      height: 350,
      child: Stack(children: [
        PageView.builder(
            controller: _pageController,
            itemCount: imageList.length,
            itemBuilder: ((context, index) {
              return imageList[index];
            })),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: imageList.length,
                  effect: WormEffect(
                      activeDotColor: AppBasicColors.green,
                      dotColor: AppBasicColors.lightGrey,
                      dotHeight: 9,
                      dotWidth: 9),
                  /* onDotClicked: ((index) {
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
            }),*/
                ),
              ),
            ))
      ]),
    );
  }
}
