import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const WidgetText({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          text,
          style: const TextStyle(
              fontSize: 20.0,
              color: AppBasicColors.black,
              fontWeight: FontWeight.bold),
        )),
        TextButton(
            onPressed: onPressed,
            child: const Text(
              'Ver más',
              style: TextStyle(
                  fontSize: 12.0,
                  color: AppBasicColors.rgb,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
