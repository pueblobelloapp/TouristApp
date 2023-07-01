import 'package:app_turismo_usuario/Recursos/Entity/UserLogin.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Login/Login.dart';
import 'package:app_turismo_usuario/Recursos/Repository/RepositoryLogin.dart';
import 'package:app_turismo_usuario/main.dart';
import 'package:email_validator/email_validator.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class ControllerLogin extends GetxController {
  final RepositoryLogin _repositoryLogin = getIt();

  Future<void> validateLoginUser(UserLogin userLogin) async {
    await _repositoryLogin.loginUser(userLogin);
  }

  bool validEmail(String email) {
    final bool isValid = EmailValidator.validate(email);
    return isValid;
  }

  /*Future<void> signInWithGoogle() async {
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

        //print(googleUser.displayName);
        //print(googleUser.email);
      }
    } catch (e) {
      // Se ha producido un error al iniciar sesión con Google
      print(e);
    }
  }*/

  Future<void> logout() async {
    //  si estoy utilizando Firebase Authentication, puedes usar el siguiente código para cerrar la sesión:
    // await FirebaseAuth.instance.signOut();

    Get.offAll(const Login());
  }
}
