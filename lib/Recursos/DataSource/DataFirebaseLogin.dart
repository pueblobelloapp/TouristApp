import 'dart:io';

import 'package:app_turismo_usuario/Recursos/Entity/UserLogin.dart';
import 'package:app_turismo_usuario/Recursos/utils/GextUtils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FirebaseLogin extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User get currentUser {
    final myUsers = FirebaseAuth.instance.currentUser;
    if (myUsers == null) throw Exception('Not authenticated exception');
    return myUsers;
  }

  final GetxUtils messageController = Get.put(GetxUtils());
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore get firebaseFiresTore => FirebaseFirestore.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;

  Future<void> registerUser(UserLogin userLogin) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: userLogin.email, password: userLogin.password);

      await credential.user!.getIdToken();
      postDetailsToFirestore(userLogin, credential).then((value) {
        print("Objeto guardado correctamente.");
      });

    } on FirebaseException catch (e) {
      if (e.code == "email-already-in-use") {
        print("Correo electronico, se encuentra registrado.");
        return Future.error("email-already-in-use");
      } else if (e.code == "invalid-email") {
        print("Correo invalido Invalid-email");
        return Future.error("invalid-email");
      } else if (e.code == "weak-password") {
        return Future.error("weak-password");
      } else {
        print("Error inesperado: $e.code");
        return Future.error("Error inesperado: $e.code");

      }
    }
  }

  Future<void> postDetailsToFirestore(UserLogin userLogin,
      UserCredential userCredential) async {
    var user = _auth.currentUser;
    final ref = firebaseFiresTore.doc('users/${user!.uid}');

    await ref.set(
        ({
          'uid': user.uid,
          'email': userLogin.email,
          'birthDate': userLogin.birthDate,
          'name': userLogin.name,
          'image': 'assets/img/user.jpg'
        }), SetOptions(merge: false));
    messageController.messageInfo("Registro", "Se registro exitoso.");
  }

  Future<void> getLogin(UserLogin userLogin) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: userLogin.email, password: userLogin.password);

    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('Usuario no Existe');
      } else if (e.code == 'wrong-password') {
        return Future.error('Contraseña incorrecta');
      }
    }
  }

  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw 'Error al cerrar sesión: $e';
    }
  }
}
