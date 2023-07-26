
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RepositorySitioTuristico {
  Stream<QuerySnapshot> selectSitioTuristicos();
  Future<void> selectSitioInteres();
  Future<void> selectInformationPueblo(String typeInformacion); //Ecoturismo, Rural, Bienestar
}