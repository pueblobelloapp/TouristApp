import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaController extends GetxController {
  GoogleMapController? mapController;

  final CameraPosition initialPosition = const CameraPosition(
    target: LatLng(10.3614559,-73.4866407), //(latitud - longitud)
    zoom: 13.0,
  );

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

// metodo ir al sitio o a la ubicacion
  /* void goToLocation(LatLng location) {
    if (mapController != null) {
      mapController!.animateCamera(CameraUpdate.newLatLng(location));
    }
  }*/

}
