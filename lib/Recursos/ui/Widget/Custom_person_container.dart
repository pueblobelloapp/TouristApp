import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class CustomPersonContainer extends StatelessWidget {
  final String? imagePath;
  final IconData? icon;
  final String name;
  final int starCount;

  final Color containerIconColor;
  final Color starColor;

  const CustomPersonContainer(
      {super.key,
      this.imagePath,
      this.icon,
      required this.name,
      required this.starCount,
      required this.containerIconColor,
      required this.starColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0.0),
      visualDensity: VisualDensity.compact,
      leading: Container(
        decoration: BoxDecoration(
            color: containerIconColor,
            borderRadius: BorderRadius.circular(8.0)),
        width: 40.0,
        height: 40.0,
        child: imagePath != null
            ? Image.asset(imagePath!)
            : Icon(
                icon,
                color: AppBasicColors.white,
              ),
      ),
      title: Text(
        name,
        style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 20.0),
      ),
      subtitle: Row(
        children: List.generate(
            starCount,
            (index) => Icon(
                  BootstrapIcons.star_fill,
                  color: starColor,
                  size: 15.0,
                )),
      ),
    );
  }
}
