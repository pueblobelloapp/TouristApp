import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Icon icon;
  final String textGuide;
  final bool obscureText;
  final TextInputType textInputType;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.icon,
      required this.textGuide,
      required this.obscureText,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 6.0, top: 0.0, right: 6.0),
          child: icon,
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        fillColor: const Color.fromRGBO(178, 190, 195, 1),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5.0),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        hintText: textGuide,
        contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
        isCollapsed: true,
        hintStyle: const TextStyle(color: AppBasicColors.white),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          //return msgError;
        }
      },
      cursorColor: AppBasicColors.black,
    );
  }
}
