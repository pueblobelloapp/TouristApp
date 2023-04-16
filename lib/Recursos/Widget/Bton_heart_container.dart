import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonHeartContainer extends StatefulWidget {
  const ButtonHeartContainer({super.key});

  @override
  State<ButtonHeartContainer> createState() => _ButtonHeartContainerState();
}

class _ButtonHeartContainerState extends State<ButtonHeartContainer> {
  bool _pressed = false;

  void onPressedFav() {
    setState(() {
      _pressed = !_pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'BtonFavorito',
      backgroundColor: AppBasicColors.lightGreen,
      mini: true,
      tooltip: 'Favorito',
      onPressed: onPressedFav,
      shape: const CircleBorder(),
      child: Icon(
        _pressed ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}
