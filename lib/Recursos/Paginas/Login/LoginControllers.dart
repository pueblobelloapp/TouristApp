import 'package:app_turismo_usuario/Recursos/Entity/UserLogin.dart';
import 'package:app_turismo_usuario/Recursos/Repository/RepositoryLogin.dart';
import 'package:app_turismo_usuario/main.dart';
import 'package:email_validator/email_validator.dart';

class ControllerLogin  {

  final RepositoryLogin _repositoryLogin = getIt();

  Future<void> validateLoginUser(UserLogin userLogin) async {
    await _repositoryLogin.loginUser(userLogin);
  }

  Future<void> validateRegisterUser(Map<String, String> userRegister) async {

    if (validPassword(userRegister["pass"]!)) {
      if (validPasswordEqual(userRegister["pass"]!,
          userRegister["passVerify"]!)) {

        print("Todo Ok");
        UserLogin user  = UserLogin();
        user.password = userRegister["pass"]!;
        user.email = userRegister["email"]!;
        user.birthDate = userRegister["birthDate"]!;
        user.name = userRegister["name"]!;

        await _repositoryLogin.registerUser(user);
      } else {
        //Error, contraseñas no son iguales
        print("Contraseñas no son iguals");
      }
    } else {
      print("Contraseña no cumple con la validaciones correctas");
    }

  }

  bool validPassword(String password) {
    if (password.trim() == "") {
      return false;
    } else {
      RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,15}$');
      return regex.hasMatch(password);
    }
  }

  bool validPasswordEqual(String password, String passwordVerify) {
    if (0 == password.compareTo(passwordVerify)
        && password.isNotEmpty) return true;

    return false;
  }

  bool validEmail(String email) {
    final bool isValid = EmailValidator.validate(email);
    return isValid;
  }
}
