import 'dart:io';

import 'package:app_turismo_usuario/Recursos/Entity/Usuario.dart';
import 'package:app_turismo_usuario/Recursos/utils/GextUtils.dart';
import 'package:app_turismo_usuario/Recursos/utils/PhotoLoad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseLogin extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final controllerPhoto = Get.put<PhotoLoad>(PhotoLoad());

  User get currentUser {
    final myUsers = FirebaseAuth.instance.currentUser;
    if (myUsers == null) throw Exception('Not authenticated exception');
    return myUsers;
  }

  final GetxUtils messageController = Get.put(GetxUtils());
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore get firebaseFiresTore => FirebaseFirestore.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;

  Future<void> registerUser(Usuario userLogin) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: userLogin.email, password: userLogin.password);

      await credential.user!.getIdToken();
      postDetailsToFirestore(userLogin).then((value) {
        print("Objeto guardado correctamente.");
        saveImageProfile();
        print("Guardando foto de perfil.");
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

  Future<void> postDetailsToFirestore(Usuario userLogin) async {
    var user = _auth.currentUser;
    final ref = firebaseFiresTore.doc('users/${user!.uid}');

    print("Usuario iniciado: ${user.uid}");

    await ref.set(
        ({
          'uid': user.uid,
          'email': userLogin.email,
          'birthDate': userLogin.birthDate,
          'name': userLogin.name,
          'image': userLogin.image.isNotEmpty ? userLogin.image : ''
        }),
        SetOptions(merge: false));
  }

  Future<UserCredential?> getLogin(Usuario userLogin) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
              email: userLogin.email, password: userLogin.password);

      return userCredential;
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('Usuario no Existe');
      } else if (e.code == 'wrong-password') {
        return Future.error('Contraseña incorrecta');
      }
    }
    return null;
  }

  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw 'Error al cerrar sesión: $e';
    }
  }

  Future<void> saveImageProfile() async {
    User myusuario = currentUser;
    String urlPhoto;
    print("Usuario registrado: ${currentUser.uid}");
    //Validacion si existe una fotografia seleccionada.
    print("Con url de photo ${controllerPhoto.selectedPhoto.value.path}");
    if (controllerPhoto.selectedPhoto.value.path.isNotEmpty) {
      final ref = firebaseFiresTore.doc('users/${myusuario.uid}');
      urlPhoto =
          await uploadPhoto(controllerPhoto.selectedPhoto.value, myusuario.uid);
      print("Foto subida: $urlPhoto");

      final fileName = controllerPhoto.selectedPhoto.value.name;
      final imagePath = '${currentUser.uid}/mySiteImages/$fileName';

      final storageRef = storage.ref(imagePath);
      await storageRef.putFile(File(controllerPhoto.selectedPhoto.value.path));
      final url = await storageRef.getDownloadURL();
      await ref
          .update({'image': url})
          .then((value) => {
                messageController.messageInfo("Perfil", "Foto actualizada"),
                controllerPhoto.imagePerfilUrl.value = url
              })
          .onError((error, stackTrace) => {
                messageController.messageError(
                    "Error perfil", "Error al guardar: " + error.toString())
              });
    }
  }

  Future<String> uploadPhoto(XFile? file, String id) async {
    final storageReference = storage.ref().child('post/${id}/${file?.path}');
    await storageReference.putFile(File(file!.path));
    return await storageReference.getDownloadURL();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUser() {
    var user = _auth.currentUser;
    print("User sesion: ${user!.uid}");

    return firebaseFiresTore
        .collection('users')
        .where("uid", isEqualTo: user!.uid)
        .snapshots();
  }

  static signOut() {}
}
