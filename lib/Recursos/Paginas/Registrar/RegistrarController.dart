import 'package:app_turismo_usuario/Recursos/utils/GextUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrarController extends GetxController {
  TextEditingController emailR = TextEditingController();
  TextEditingController passwordR = TextEditingController();
  TextEditingController passwordConfR = TextEditingController();
  TextEditingController nameR = TextEditingController();
  TextEditingController dateOfBirthR = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final GetxUtils messageController = Get.put(GetxUtils());
}
