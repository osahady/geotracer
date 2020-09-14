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
      ),
    );
  } //build
} //class
