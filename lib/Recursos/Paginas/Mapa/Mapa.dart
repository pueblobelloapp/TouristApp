import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Widget/Gradient_Header.dart';
import 'MapaController.dart';

class MapaPage extends GetView<MapaController> {
  @override
  Widget build(BuildContext context) {
    final MapaController mapaController = Get.put(MapaController());
    return Scaffold(
        body: GoogleMap(
      initialCameraPosition: mapaController.initialPosition,
      onMapCreated: mapaController.onMapCreated,
    ));
  }
}
