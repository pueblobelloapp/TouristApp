import 'package:cloud_firestore/cloud_firestore.dart';

import '../Entity/sitio.dart';

abstract class SitioRepository {
  Stream<List<Sitio?>?> getAll();
  Stream<Sitio?> getId(String id);
  Stream<Map?> getUsuario(String id);
  Future delete(id);
  Future edit(obj);
  Future addComentario(id, nuevaPuntuacion);
}

class SitioRepositoryImp extends SitioRepository {
  final CollectionReference _db =
      FirebaseFirestore.instance.collection('sites');

  @override
  Stream<List<Sitio?>?> getAll() {
    return _db.snapshots().map((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.map((e) {
          if (e.exists) {
            dynamic data = e.data();
            return Sitio.fromMap(data, e.id);
          } else {
            Map<String, String> mapaResp = {'data': 'Sin datos'};
            return Sitio.fromMap(mapaResp, 1);
          }
        }).toList();
      } else {
        return null;
      }
    });
  }

  @override
  Stream<Sitio?> getId(String id) {
    return _db.doc(id).snapshots().map((snapshot) {
      if (snapshot.exists) {
        dynamic data = snapshot.data()!;
        return Sitio.fromMap(data, snapshot.id);
      } else {
        return null;
      }
    });
  }

  @override
  Stream<Map?> getUsuario(String id) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        return snapshot.data()!;
      } else {
        return null;
      }
    });
  }

  @override
  Future delete(id) async {
    // return api.delete(id);
  }
  @override
  Future edit(obj) async {
    // return api.edit( obj );
  }
  @override
  Future addComentario(id, nuevaPuntuacion) async {
    return await _db.doc(id).get().then((value) async {
      if (value.exists) {
        dynamic data = value.data();

        List puntuaciones = data['puntuacion'];

        bool encontrado = false;

        for (int i = 0; i < puntuaciones.length; i++) {
          if (puntuaciones[i]['uid'] == nuevaPuntuacion['uid']) {
            puntuaciones[i] = nuevaPuntuacion;
            encontrado = true;
          }
        }

        if (!encontrado) {
          puntuaciones.add(nuevaPuntuacion);
        }

        await _db.doc(id).update({'puntuacion': puntuaciones});
        return true;
      } else {
        return false;
      }
    });
  }
}
