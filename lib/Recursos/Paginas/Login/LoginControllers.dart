import 'package:app_turismo_usuario/Recursos/Entity/UserLogin.dart';
import 'package:app_turismo_usuario/Recursos/Repository/RepositoryLogin.dart';
import 'package:app_turismo_usuario/main.dart';

/**
 * Comunicacion con la base de datos y validaciones de campos recibidos.
 */
class ControllerLogin  {

  final RepositoryLogin _repositoryLogin = getIt();

  Future<void> validateLoginUser(UserLogin userLogin) async {
    await _repositoryLogin.loginUser(userLogin);
  }


}
