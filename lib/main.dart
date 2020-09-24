import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geotracer/services/geolocator_service.dart';
import './screens/map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final geoService = GeolocatorServiceAbuAli();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tracing'),
        ),
        body: Center(
          child: FutureBuilder<Position>(
              future: geoService.getInitialLocation(),
              builder: (context, snapshot) {
                if (snapshot.data == null) return null;
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Map(snapshot.data);
              }),
        ),
      ),
    );
  } //build
} //calss
