import 'dart:io';

import 'package:app_turismo_usuario/Recursos/Entity/UserLogin.dart';
import 'package:app_turismo_usuario/Recursos/utils/GextUtils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FirebaseLogin extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late final Rx<User> _userLogin;

  User get currentUser {
    final myUsers = FirebaseAuth.instance.currentUser;
    if (myUsers == null) throw Exception('Not authenticated exception');
    return myUsers;
  }

  final GetxUtils messageController = Get.put(GetxUtils());
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore get firebaseFiresTore => FirebaseFirestore.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;

  Future<void> registerUser(
      String email, String password, String nombre, String contacto) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      print("Credenciales: " + credential.toString());
    } on FirebaseException catch (e) {
      if (e.code == "email-already-in-use") {
        messageController.messageError(
            "Validacion email", "Correo electronico, se encuentra registrado.");
      }
    }
  }

  Future<void> postDetailsToFirestore(String nombre, String contacto) async {
    var user = _auth.currentUser;
    final ref = firebaseFiresTore.doc('users/${user!.uid}');

    await ref.set(
        ({
          'uid': user.uid,
          'nombre': nombre,
          'edad': '0',
          'genero': 'Sin Definir',
          'correo': user.email,
          'contacto': contacto,
          'foto': 'assets/img/user.jpg'
        }),
        SetOptions(merge: false));
    messageController.messageInfo("Registro", "Se registro exitoso.");
  }

  Future<void> getLogin(UserLogin userLogin) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: userLogin.correo, password: userLogin.contrasena);

      _userLogin = userCredential.user as Rx<User>;

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
