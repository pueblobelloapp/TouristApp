
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FirebaseInformationSites extends GetxController {

  FirebaseFirestore get firebaseFiresTore => FirebaseFirestore.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;

  //TODO: Information of sites turism
  Stream<QuerySnapshot> selectSitesTurismo() {
    return firebaseFiresTore
        .collection('sites')
        .snapshots();
  }

  Stream<QuerySnapshot> servicesAndTypeSite(String typeSite, String activity) {
    return firebaseFiresTore
        .collection('sites')
        .where("tipoTurismo", isEqualTo: typeSite)
        .where("servicios", arrayContains: activity)
        .snapshots();
  }

}