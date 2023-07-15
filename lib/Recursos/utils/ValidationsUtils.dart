
import 'package:get/get.dart';

class ValidationUtils extends GetxController {

  bool validPassword(String password) {
    if (password.isEmpty) {
      return false;
    } else {
      RegExp regex = RegExp(r"^(?=.{6,8}$).*$");
      return regex.hasMatch(password);
    }
  }

  bool validPasswordEqual(String password, String passwordVerify) {
    if (0 == password.compareTo(passwordVerify) && password.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool validPasswordRegister(String password, String passwordVerify) {
    if (validPassword(password) &&
        validPasswordEqual(password, passwordVerify)) {
      return true;
    } else {
      return false;
    }
  }
}