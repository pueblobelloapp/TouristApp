import 'package:app_turismo_usuario/Recursos/Entity/Usuario.dart';
import 'package:app_turismo_usuario/Recursos/Repository/RepositoryLogin.dart';
import 'package:app_turismo_usuario/Recursos/routes/app_pages.dart';
import 'package:app_turismo_usuario/Recursos/utils/GextUtils.dart';
import 'package:app_turismo_usuario/Recursos/utils/NotificationValidation.dart';
import 'package:app_turismo_usuario/Recursos/utils/ValidationsUtils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/PhotoLoad.dart';

class RegistrarController extends GetxController {
  final RepositoryLogin _repositoryLogin = Get.find();
  // final RepositoryLogin _repositoryLogin = getIt();

  TextEditingController emailR = TextEditingController();
  TextEditingController passwordR = TextEditingController();
  TextEditingController passwordConfR = TextEditingController();
  TextEditingController nameR = TextEditingController();
  TextEditingController dateOfBirthR = TextEditingController();

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  final GetxUtils messageController = Get.put(GetxUtils());

  final controller = Get.put<ValidationUtils>(ValidationUtils());

  NotificationMessage notificationMessage = NotificationMessage(
      imagePath: 'Assets/Img/error.gif',
      title: 'Registro de usuario',
      message: 'Mensaje',
      flipVertical: true,
      shouldTransform: true,
      onPressed: () {
        Get.back();
      });

  // Variable para guardar la foto
  var selectedPhotoRegister = XFile('').obs;
  var imagePerfilUrl = ''.obs;

  // Método para seleccionar una foto
  void selectPhoto() async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // print("Tomando valor de fotografia.");
      selectedPhotoRegister.value = pickedImage;
      update();
    }
  }

  Future<void> validateRegisterUser(
      Map<String, String> userRegister, BuildContext context) async {
    final bool isValidEmail = EmailValidator.validate(userRegister["email"]!);

    if (controller.validPassword(userRegister["pass"]!)) {
      if (controller.validPasswordEqual(
          userRegister["pass"]!, userRegister["passVerify"]!)) {
        if (isValidEmail) {
          // print("Todo Ok");
          Usuario user = Usuario();
          user.password = userRegister["pass"]!;
          user.email = userRegister["email"]!;
          user.birthDate = userRegister["birthDate"]!.isEmpty
              ? "Sin definir"
              : userRegister["birthDate"]!;
          user.name = userRegister["name"]!.isEmpty
              ? "Sin definir"
              : userRegister["name"]!;
          // notificationMessage.onPressed = () {
          //   Get.back();
          // };

          await _repositoryLogin.registerUser(user).then((value) {
            /* notificationMessage.message = "Registro exitoso";
            notificationMessage.imagePath = "Assets/Img/thumb-down.gif";
            notificationMessage.shouldTransform = false;
            notificationMessage.onPressed = () {
              Get.toNamed(Routes.Login);
            };*/
            cleanField();
            NotificationMessage(
                imagePath: 'Assets/Img/thumb-down.gif',
                title: 'Registro de usuario',
                message: 'Registro exitoso',
                flipVertical: true,
                shouldTransform: false,
                onPressed: () {
                  //Get.toNamed(Routes.Login);
                  Get.back();
                  Get.back();
                }).showNotification(context);
          })

              // ignore: body_might_complete_normally_catch_error
              .catchError((onError) {
            if (onError == "email-already-in-use") {
              notificationMessage.message =
                  "Correo electronico, se encuentra registrado.";
            } else if (onError == "invalid-email") {
              notificationMessage.message = "Correo no valido.";
            } else if (onError == "weak-password") {
              notificationMessage.message =
                  "Contraseña es debil, minimo 6 caracteres";
            } else {
              notificationMessage.message = onError.toString();
            }
            notificationMessage.showNotification(context);
          });
        } else {
          notificationMessage.message = "Correo no cumple los requisitos.";
          notificationMessage.showNotification(context);
        }
      } else {
        notificationMessage.message = "Contraseñas no coinciden.";
        notificationMessage.showNotification(context);
      }
    } else {
      notificationMessage.message = "Minimo 6 caracteres y maximo 8.";
      notificationMessage.showNotification(context);
    }
  }

  void cleanField() {
    emailR.clear();
    passwordR.clear();
    passwordConfR.clear();
    nameR.clear();
    dateOfBirthR.clear();
    Get.find<PhotoLoad>().resetPhoto();
  }

  Future<DateTime?> selectDate(BuildContext context) async {
    return showDatePicker(
      context: context,
      firstDate: DateTime(1943),
      initialDate: DateTime(2000),
      lastDate: DateTime(DateTime.now().year - 18),
    );
  }
}
