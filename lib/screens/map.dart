import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geotracer/services/geolocator_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  final Position initPosition;

  Map(this.initPosition);
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final GeolocatorServiceAbuAli geoService = GeolocatorServiceAbuAli();
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    geoService.getCurrentLocation().listen((position) {
      centerScreen(position);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initPosition.latitude, widget.initPosition.longitude),
          zoom: 18.0,
        ),
        mapType: MapType.satellite,
        myLocationEnabled: true,
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
      ),
    );
  } //build

  Future<void> centerScreen(Position position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 18.0,
        ),
      ),
    );
  }
} //class
