import 'package:app_turismo_usuario/Recursos/DataSource/DataFirebaseInformationSites.dart';
import 'package:app_turismo_usuario/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../RepositoryInformationSites.dart';

class RepositoryInformationSitesImp extends RepositorySitioTuristico {
  final FirebaseInformationSites _firebaseInformationSites = getIt();

  @override
  Future<void> selectInformationPueblo(String typeInformacion) {
    // TODO: implement selectInformationPueblo
    throw UnimplementedError();
  }

  @override
  Future<void> selectSitioInteres() {
    // TODO: implement selectSitioInteres
    throw UnimplementedError();
  }

  @override
  Stream<QuerySnapshot> selectSitioTuristicos() {
    // TODO: implement selectSitioTuristicos
    return _firebaseInformationSites.selectSitesTurismo();
  }

  @override
  Stream<QuerySnapshot> selectSitesServicesAndTypeSite(String typeSite, String activity) {
    return _firebaseInformationSites.servicesAndTypeSite(typeSite, activity);
  }

}