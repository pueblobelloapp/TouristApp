import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  String pathImage;

  CardImage(this.pathImage, {super.key});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 350.0,
      width: 450.0,
      margin: const EdgeInsets.only(top: 00.0, left: 0.04, right: 0.04),
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage)),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        shape: BoxShape.rectangle,
        /*boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]*/
      ),
    );

    return Stack(
      children: [card],
    );
  }
}
