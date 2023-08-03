
import 'package:app_turismo_usuario/Recursos/Entity/Usuario.dart';
import 'package:get/get.dart';

import '../controllers/DataFirebaseLogin.dart';

abstract class RepositoryLogin {

  Future<void> loginUser(Usuario user);
  Future<void> registerUser(Usuario user);
  Future<void> registerUserWithGoogle(Usuario userLogin);
  Future<void> signOut();

}

class RepositoryLoginImp extends RepositoryLogin {
    final FirebaseLogin _firebaseLogin = Get.put<FirebaseLogin>(FirebaseLogin());
    // final FirebaseLogin _firebaseLogin = getIt();

  @override
  Future<void> loginUser(Usuario user) {
    // TODO: implement loginUser
    return _firebaseLogin.getLogin(user);
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> registerUser(Usuario user) {
    // TODO: implement validateRegisterUser
    return _firebaseLogin.registerUser(user);
  }

  @override
  Future<void> registerUserWithGoogle(Usuario userLogin) async {
    return _firebaseLogin.postDetailsToFirestore(userLogin);
  }

}