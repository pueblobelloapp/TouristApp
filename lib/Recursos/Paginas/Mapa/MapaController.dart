import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapaController extends GetxController {
  GoogleMapController? mapController;

  final CameraPosition initialPosition = const CameraPosition(
    target: LatLng(10.4162, -73.5827), //(latitud - longitud)
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
