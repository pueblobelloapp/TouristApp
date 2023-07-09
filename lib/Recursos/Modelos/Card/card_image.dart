import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  String pathImage;

  CardImage(this.pathImage, {super.key});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: 450.0,
      height: 282.0,
      //margin: const EdgeInsets.only(left: 0.04, right: 0.04),
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage)),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
        shape: BoxShape.rectangle,
      ),
    );

    return Stack(
      children: [card],
    );
  }
}
