
import 'package:app_turismo_usuario/Recursos/Entity/UserLogin.dart';

abstract class RepositoryLogin {

  Future<void> loginUser(UserLogin user);
  Future<void> registerUser(UserLogin user);
  Future<void> registerUserWithGoogle(UserLogin userLogin);
  Future<void> signOut();

}