import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String buttonText;
  final double? buttonFontSize;
  final EdgeInsetsGeometry padding;

  const WidgetText(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.buttonText,
      this.padding = const EdgeInsets.symmetric(horizontal: 10),
      this.buttonFontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20.0,
                color: AppBasicColors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: buttonFontSize,
                color: AppBasicColors.rgb,
                  fontWeight: FontWeight.bold
              ),
            )
          )
        ],
      ),
    );
  }
}
