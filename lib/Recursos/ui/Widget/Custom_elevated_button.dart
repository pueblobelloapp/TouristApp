import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final IconData? icon;
  final Widget? child;
  final bool? fixedSize;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = AppBasicColors.colorElevatedButtonBlue,
    this.textColor = AppBasicColors.white,
    this.fontSize = 16.0,
    this.borderRadius = 5.0,
    this.padding = const EdgeInsets.all(12.0),
    this.margin = EdgeInsets.zero,
    this.icon,
    this.child,
    this.fontWeight,
    this.fixedSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          elevation: 3,
          textStyle: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          padding: padding,
          fixedSize: fixedSize == true ? const Size(250.0, 45.0) : null),
      onPressed: onPressed,
      child: child ?? _buildDefaultChild(), //Text(text)
    );
  }

  Widget _buildDefaultChild() {
    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            child: Icon(
              icon!,
              size: 20.0,
            ),
          ),
          const SizedBox(width: 5.0),
          Text(text)
        ],
      );
    } else {
      return Text(text, style: const TextStyle(fontSize: 20),);
    }
  }
}
