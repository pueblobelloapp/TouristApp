
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Entity/Sitio.dart';

abstract class SitioRepository {
  Stream<List<Sitio?>?> getAll();
  Stream<Sitio?> getId(String id);
  Future delete(id);
  Future edit(obj);
  Future add(obj);
}

class SitioRepositoryImp extends SitioRepository {

  final CollectionReference _db = FirebaseFirestore.instance.collection('sites');

  @override
  Stream<List<Sitio?>?> getAll(){
    return _db.snapshots().map(
      (snapshot){
        if (snapshot.docs.isNotEmpty) {
          return snapshot.docs.map((e){
            if(e.exists){
              print(e.data());
              dynamic data = e.data();
              return Sitio.fromMap(data, e.id);
            }else{
              return null;
            }
          }).toList();
        } else {
          return null;
        }
      }
    );
  }

  @override
  Stream<Sitio?> getId(String id){
    return _db.doc(id).snapshots().map(
      (snapshot){
        if (snapshot.exists) {
          dynamic data = snapshot.data()!;
          return Sitio.fromMap(data, snapshot.id);
        } else {
          return null;
        }
      }
    );
  }
  @override
  Future delete(id)async{
    // return api.delete(id);
  }
  @override
  Future edit(obj)async{
    // return api.edit( obj );
  }
  @override
  Future add(obj)async{
      // return api.add( obj );
  }

}