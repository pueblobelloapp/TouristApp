import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaController extends GetxController {
  GoogleMapController? mapController;

  final CameraPosition initialPosition = const CameraPosition(
    target: LatLng(51.5, -0.09),
    zoom: 13.0,
  );

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
