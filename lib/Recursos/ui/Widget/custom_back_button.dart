import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 30.0,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(178, 190, 195, 1),
        borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: InkWell(
        onTap: onPressed,
        child: const Center(
          child: Icon(
            BootstrapIcons.arrow_left,
            color: AppBasicColors.black,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}
