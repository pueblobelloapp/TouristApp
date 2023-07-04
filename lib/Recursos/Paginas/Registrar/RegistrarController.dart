import 'package:app_turismo_usuario/Recursos/Entity/UserLogin.dart';
import 'package:app_turismo_usuario/Recursos/Repository/RepositoryLogin.dart';
import 'package:app_turismo_usuario/Recursos/utils/GextUtils.dart';
import 'package:app_turismo_usuario/main.dart';
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
  final RepositoryLogin _repositoryLogin = getIt();

  Future<void> validateRegisterUser(Map<String, String> userRegister) async {
    if (validPassword(userRegister["pass"]!)) {
      if (validPasswordEqual(
          userRegister["pass"]!, userRegister["passVerify"]!)) {
        print("Todo Ok");
        UserLogin user = UserLogin();
        user.password = userRegister["pass"]!;
        user.email = userRegister["email"]!;
        user.birthDate = userRegister["birthDate"]!;
        user.name = userRegister["name"]!;

        await _repositoryLogin.registerUser(user);
      } else {
        //Error, contraseñas no son iguales
        print("Validar contraseñas");
      }
    } else {
      print("Contraseña no cumple con la validaciones correctas");
    }
  }

  bool validPassword(String password) {
    if (password.isEmpty) {
      return false;
    } else {
      RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,15}$');
      return regex.hasMatch(password);
    }
  }

  bool validPasswordEqual(String password, String passwordVerify) {
    if (0 == password.compareTo(passwordVerify) && password.isNotEmpty)
      return true;

    return false;
  }

  Future<DateTime?> selectDate(BuildContext context) async {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2006),
        lastDate: DateTime.now());
  }
}
