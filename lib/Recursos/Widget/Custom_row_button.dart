import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomRowButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color? textColor;

  const CustomRowButton(
      {super.key,
      this.icon,
      required this.text,
      required this.onPressed,
      required this.color,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          minimumSize: MaterialStateProperty.all(const Size(250.0, 48.0))),
      onPressed: onPressed,
      child: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              color: AppBasicColors.black,
            ),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            text,
            style: TextStyle(
              color: textColor ?? AppBasicColors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
