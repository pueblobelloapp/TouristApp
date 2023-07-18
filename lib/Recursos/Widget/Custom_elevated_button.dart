import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final double fontSize;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.color = AppBasicColors.colorElevatedButtonBlue,
      this.textColor = AppBasicColors.white,
      this.fontSize = 14,
      this.borderRadius = 8.0,
      this.padding = const EdgeInsets.all(12.0),
      this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: textColor,
            textStyle: TextStyle(fontSize: fontSize),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
            padding: padding),
        child: Text(text));
  }
}
