import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'MapaController.dart';

class MapaPage extends GetView<MapaController> {
  final MapaController mapaController = Get.put(MapaController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(10.3614559,-73.4866407), //(latitud - longitud)
          zoom: 13.0,
        ),
        mapType: MapType.normal,
      )
    );
  }
}
