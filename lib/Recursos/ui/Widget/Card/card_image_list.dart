import 'package:app_turismo_usuario/Recursos/ui/Widget/Card/card_image.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CardImageList extends StatefulWidget {
  final List imageList;
  final bool radiusBottom;

  const CardImageList(
      {super.key, required this.imageList, this.radiusBottom = true});

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
    if (widget.imageList.isEmpty) {
      return const SizedBox();
    }

    return SizedBox(
      height: 282.0,
      child: Stack(children: [
        PageView.builder(
            controller: _pageController,
            itemCount: widget.imageList.length,
            itemBuilder: ((context, index) {
              return Hero(
                tag: widget.imageList[index],
                //widget.imageList[index],
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HeroPhotoViewRouteWrapper(
                              imageProvider: widget.imageList[index],
                            )));
                  },
                  child: CardImage(
                    widget.imageList[index],
                    key: UniqueKey(),
                    radiusBottom: widget.radiusBottom,
                  ),
                ),
                //radiusBottom: widget.radiusBottom,
              );
            })),
        Visibility(
          visible: widget.imageList.length > 1,
          child: Align(
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
                        dotWidth: 9)),
              )),
        )
      ]),
    );
  }
}

class HeroPhotoViewRouteWrapper extends StatelessWidget {
  final String imageProvider;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  const HeroPhotoViewRouteWrapper({
    required this.imageProvider,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: PhotoView(
        imageProvider: NetworkImage(imageProvider),
        backgroundDecoration:
            backgroundDecoration ?? const BoxDecoration(color: Colors.white),
        minScale: minScale,
        maxScale: maxScale,
        //heroAttributes: const PhotoViewHeroAttributes(tag:imageList[index]),
      ),
    );
  }
}
