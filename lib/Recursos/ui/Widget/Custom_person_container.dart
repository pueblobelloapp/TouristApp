import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class CustomPersonContainer extends StatelessWidget {
  final String? imagePath;
  final IconData? icon;
  final String name;
  final int starCount;

  final Color containerIconColor;

  const CustomPersonContainer({
    super.key,
    this.imagePath,
    this.icon,
    required this.name,
    required this.starCount,
    required this.containerIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0.0),
      visualDensity: VisualDensity.compact,
      leading: Container(
        decoration: BoxDecoration(
          color: containerIconColor,
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(
              imagePath!,
            ),
            fit: BoxFit.cover,
            onError: (exception, stackTrace){},
          )
        ),
        width: 40.0,
        height: 40.0,
        
        child: Visibility(
          visible: imagePath==null,
          child: Icon(
                icon,
                color: AppBasicColors.white,
              )
          )
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
            5,
            (index) => Icon(
                  BootstrapIcons.star_fill,
                  color: index < starCount ? AppBasicColors.yellow : AppBasicColors.greyRgba,
                  size: 15.0,
                )),
      ),
    );
  }
}
