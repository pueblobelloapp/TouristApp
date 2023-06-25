
import 'package:app_turismo_usuario/Recursos/DataSource/DataFirebaseLogin.dart';
import 'package:app_turismo_usuario/Recursos/Entity/UserLogin.dart';
import 'package:app_turismo_usuario/Recursos/Repository/RepositoryLogin.dart';
import 'package:app_turismo_usuario/main.dart';

class RepositoryLoginImp extends RepositoryLogin {
    final FirebaseLogin  _firebaseLogin = getIt();

  @override
  Future<void> loginUser(UserLogin user) {
    // TODO: implement loginUser
    return _firebaseLogin.getLogin(user);
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> registerUser(UserLogin user) {
    // TODO: implement validateRegisterUser
    return _firebaseLogin.registerUser(user);
  }
}