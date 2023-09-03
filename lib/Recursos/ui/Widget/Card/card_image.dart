import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String pathImage;
  final bool radiusBottom;
  const CardImage(this.pathImage, {super.key, this.radiusBottom = true});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: 450.0,
      height: 282.0,
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(pathImage)),
        borderRadius: radiusBottom ? const BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0)
        ):null,
        shape: BoxShape.rectangle,
      ),
    );

    return Stack(
      children: [card],
    );
  }
}
