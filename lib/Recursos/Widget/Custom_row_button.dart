import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomRowButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const CustomRowButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.onPressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          minimumSize: MaterialStateProperty.all(const Size(150.0, 52.0))),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            color: AppBasicColors.black,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            text,
            style: const TextStyle(
                color: AppBasicColors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
