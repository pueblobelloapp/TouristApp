import 'package:app_turismo_usuario/Recursos/DataSource/DataFirebaseLogin.dart';
import 'package:app_turismo_usuario/Recursos/Entity/UserLogin.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Home/home.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Login/Login.dart';
import 'package:app_turismo_usuario/Recursos/Repository/RepositoryLogin.dart';
import 'package:app_turismo_usuario/Recursos/utils/NotificationValidation.dart';
import 'package:app_turismo_usuario/Recursos/utils/ValidationsUtils.dart';
import 'package:app_turismo_usuario/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ControllerLogin extends GetxController {
  final RepositoryLogin _repositoryLogin = getIt();
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailL = TextEditingController();
  final TextEditingController passwordL = TextEditingController();

  UserLogin userLogin = UserLogin();

  NotificationMessage notificationMessage = NotificationMessage(
      imagePath: 'Assets/Img/error.gif',
      title: 'Inicio de sesion',
      message: 'Mensaje',
      flipVertical: true,
      shouldTransform: true,
      onPressed: () {
        Get.back();
      });

  Future<void> accessLoginUser(UserLogin userLogin) async {
    await _repositoryLogin.loginUser(userLogin);
  }

  bool validEmail(String email) {
    final bool isValid = EmailValidator.validate(email);
    return isValid;
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        // El usuario ha iniciado sesión con Google
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        userLogin.email = userCredential.user!.email!;
        userLogin.name = userCredential.user!.displayName!;
        userLogin.image = userCredential.user!.photoURL!;
        userLogin.birthDate = "Sin definir";

        _repositoryLogin
            .registerUserWithGoogle(userLogin)
            .then((value) => Get.to(() => Home()));
      }
    } catch (e) {
      print(e);
      notificationMessage.message = "Ups ocurrio un error.";
      notificationMessage.showNotification(context);
    }
  }

  Future<void> logout() async {
    //  si estoy utilizando Firebase Authentication, puedes usar el siguiente código para cerrar la sesión:
    // await FirebaseAuth.instance.signOut();

    //Get.offAll(const Login());
  }

  void getLoginUser(BuildContext context) {
    final controller = Get.put<ValidationUtils>(ValidationUtils());
    final bool isValidEmail = EmailValidator.validate(emailL.text.toString());

    print(isValidEmail);

    if (formKey.currentState!.validate() && isValidEmail) {
      if (controller.validPassword(passwordL.text.trim())) {
        userLogin.password = passwordL.text.trim();
        userLogin.email = emailL.text.trim();

        accessLoginUser(userLogin)
            .then((value) => {Get.offAll(Home())})
            .catchError((onError) {
          if (onError == "wrong-password") {
            notificationMessage.message = "Correo o contraseña son incorrectos";
          } else if (onError == "user-not-found") {
            notificationMessage.message = "Correo no existente.";
          } else {
            notificationMessage.message = onError.toString();
          }
          notificationMessage.showNotification(context);
        });
      } else {
        print("Error");
        notificationMessage.message = "Comprueba la contraseña";
        notificationMessage.showNotification(context);
      }
    } else {
      print("Error correo");
      notificationMessage.message = "Comprobar correo electronico";
      notificationMessage.showNotification(context);
    }
  }
}
