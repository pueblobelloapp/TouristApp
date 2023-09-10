import 'package:app_turismo_usuario/Recursos/Entity/Usuario.dart';
import 'package:app_turismo_usuario/Recursos/ui/Paginas/Login/login.dart';
import 'package:app_turismo_usuario/Recursos/Repository/RepositoryLogin.dart';
import 'package:app_turismo_usuario/Recursos/utils/NotificationValidation.dart';
import 'package:app_turismo_usuario/Recursos/utils/ValidationsUtils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ControllerLogin extends GetxController {
  final RepositoryLogin _repositoryLogin =
      Get.put<RepositoryLogin>(RepositoryLoginImp());

  final usuario = Usuario().obs;

  @override
  void onInit() async {
    await datosSesion();
    super.onInit();
  }

  Future datosSesion() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        // validarSesion(user.uid);
        usuario.value.id = user.uid;
        print(user);
      }
    });
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      usuario.value = Usuario();
      Get.snackbar('Ok', 'Se ha cerrado la sesión',
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          maxWidth: 500);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', 'Ha ocurrido un error al cerrar sesión',
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          maxWidth: 500);
    }
  }

  /// este metodo valida si hay sesion iniciada y permite ejecutar una accion
  void validarPermisosAccion({required Function accion}) {
    if (usuario.value.id.isEmpty) {
      Get.to(const Login());
    } else {
      accion();
    }
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
        print(userCredential.user!);

        userLogin.email = userCredential.user!.email!;
        userLogin.name = userCredential.user!.displayName!;
        userLogin.image = userCredential.user!.photoURL!;
        userLogin.birthDate = "Sin definir";

        usuario.value.id = userCredential.user!.uid;
        usuario.refresh();

        await _repositoryLogin.registerUserWithGoogle(userLogin).then((value) {
          // Limpia los campos después de un inicio de sesión exitoso
          cleanField();
          Get.back();
        });
      }
    } catch (e) {
      print(e);
      notificationMessage.message = "Ups ocurrio un error.";
      notificationMessage.showNotification(context);
    }
  }

  void cleanField() {
    emailL.clear();
    passwordL.clear();
  }

  // final RepositoryLogin _repositoryLogin = getIt();
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailL = TextEditingController();
  final TextEditingController passwordL = TextEditingController();

  Usuario userLogin = Usuario();

  NotificationMessage notificationMessage = NotificationMessage(
      imagePath: 'Assets/Img/error.gif',
      title: 'Inicio de sesion',
      message: 'Mensaje',
      flipVertical: true,
      shouldTransform: true,
      onPressed: () {
        Get.back();
      });

  Future<UserCredential?> accessLoginUser(Usuario userLogin) async {
    return await _repositoryLogin.loginUser(userLogin);
  }

  bool validEmail(String email) {
    final bool isValid = EmailValidator.validate(email);
    return isValid;
  }

  Future<bool> getLoginUser(BuildContext context) async {
    final controller = Get.put<ValidationUtils>(ValidationUtils());
    final bool isValidEmail = EmailValidator.validate(emailL.text.toString());

    if (formKey.currentState!.validate() && isValidEmail) {
      if (controller.validPassword(passwordL.text.trim())) {
        userLogin.password = passwordL.text.trim();
        userLogin.email = emailL.text.trim();

        return await accessLoginUser(userLogin).then((value) {
          if (value != null) {
            usuario.value.id = value!.user!.uid;
            usuario.refresh();
            cleanField();
            return true;
          } else {
            return false;
          }
        }).catchError((onError) {
          if (onError == "wrong-password") {
            notificationMessage.message = "Correo o contraseña son incorrectos";
          } else if (onError == "user-not-found") {
            notificationMessage.message = "Correo no existente.";
          } else {
            notificationMessage.message = onError.toString();
          }
          notificationMessage.showNotification(context);
          return false;
        });
      } else {
        notificationMessage.message = "Comprueba la contraseña";
        notificationMessage.showNotification(context);
        return false;
      }
    } else {
      print("Error correo");
      notificationMessage.message = "Comprobar correo electronico";
      notificationMessage.showNotification(context);
      return false;
    }
  }

  Future recuperarPassword(String correo) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: correo);
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'user-not-found') {
        return Future.error('user-not-found');
      } else if (e.code == "invalid-email") {
        return Future.error('invalid-email');
      } else {
        return Future.error(e.code.toString());
      }
    }
  }
}
