import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geotracer/services/geolocator_service.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final GeolocatorServiceAbuAli geoService = GeolocatorServiceAbuAli();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: StreamBuilder<Position>(
          stream: geoService.getCurrentLocation(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'Lat: ${snapshot.data.latitude}',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Center(
                  child: Text(
                    'Lng: ${snapshot.data.longitude}',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            );
          }),
    );
  } //build
} //class
