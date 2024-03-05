import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<StatefulWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation =
        const CameraPosition( target: LatLng(37.807438, -122.419924));

    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      height: MediaQuery.of(context).size.width - 40,
      child: GoogleMap(
        myLocationEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: initialLocation,

      ),
    );
  }
}
