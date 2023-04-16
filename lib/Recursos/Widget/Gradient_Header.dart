import 'package:flutter/material.dart';

class GradientHeader extends StatelessWidget {
  const GradientHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(125, 164, 83, 9.0),
        Color.fromRGBO(242, 238, 237, 0.0)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    );
  }
}
