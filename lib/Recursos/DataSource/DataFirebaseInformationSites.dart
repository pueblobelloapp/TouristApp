
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FirebaseInformationSites extends GetxController {

  FirebaseFirestore get firebaseFiresTore => FirebaseFirestore.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;

  //TODO: Information of sites turism
  Stream<QuerySnapshot> selectSitiosTuristico() {
    return firebaseFiresTore
        .collection('sites')
        .snapshots();
  }

}