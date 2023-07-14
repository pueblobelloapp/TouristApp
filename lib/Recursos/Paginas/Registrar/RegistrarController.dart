import 'package:app_turismo_usuario/Recursos/Entity/UserLogin.dart';
import 'package:app_turismo_usuario/Recursos/Repository/RepositoryLogin.dart';
import 'package:app_turismo_usuario/Recursos/utils/GextUtils.dart';
import 'package:app_turismo_usuario/Recursos/utils/NotificationValidation.dart';
import 'package:app_turismo_usuario/Recursos/utils/ValidationsUtils.dart';
import 'package:app_turismo_usuario/main.dart';
import 'package:email_validator/email_validator.dart';
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

  final controller = Get.put<ValidationUtils>(ValidationUtils());

  NotificationMessage notificationMessage =
  NotificationMessage(
      imagePath: 'Assets/Img/error.gif',
      title: 'Registro',
      message: 'Mensaje',
      flipVertical: true,
      shouldTransform: true,
      onPressed: () {
        Get.back();
      });

  Future<void> validateRegisterUser(Map<String, String> userRegister,
      BuildContext context) async {

    final bool isValidEmail = EmailValidator.validate(userRegister["email"]!);

    if (controller.validPasswordRegister(userRegister["pass"]!,
                                         userRegister["passVerify"]!)) {

      print(isValidEmail);
       if (isValidEmail) {
         print("Todo Ok");
         UserLogin user = UserLogin();
         user.password = userRegister["pass"]!;
         user.email = userRegister["email"]!;
         user.birthDate = userRegister["birthDate"]!.isEmpty ? "Sin definir" :
                                                   userRegister["birthDate"]!;
         user.name = userRegister["name"]!.isEmpty ? "Sin definir" :
                                                   userRegister["name"]!;

         await _repositoryLogin.registerUser(user);
         notificationMessage.message = "Registro exitoso";
         notificationMessage.imagePath = "Assets/Img/thumb-down.gif";
       } else {
         notificationMessage.message =
         "Correo no cumple los requisitos.";
       }
    } else {
      notificationMessage.message =
                "Contraseñas no cumplen con las validaciones.";
    }

    notificationMessage.showNotification(context);
  }

  Future<DateTime?> selectDate(BuildContext context) async {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2006),
        lastDate: DateTime.now());
  }
}
