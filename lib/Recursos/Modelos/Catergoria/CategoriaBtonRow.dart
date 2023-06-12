import 'package:app_turismo_usuario/Recursos/Modelos/Catergoria/CategoriaBton.dart';
import 'package:app_turismo_usuario/Recursos/Modelos/Catergoria/CategoriaBtonRowController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_theme.dart';

class CategoryButtonRow extends GetView<CategoryButtonRowController> {
  const CategoryButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (CategoryButton button in controller.buttons)
          Container(
            width: 49.0,
            height: 49.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: AppBasicColors.rgb,
            ),
            //padding: const EdgeInsets.all(0.0),
            child: IconButton(icon: button.icon, onPressed: button.onPressed),
          )
      ],
    );
  }
}
