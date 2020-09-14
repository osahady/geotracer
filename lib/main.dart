import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geotracer/services/geolocator_service.dart';
import 'package:provider/provider.dart';
import './screens/map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final geoService = GeolocatorServiceAbuAli();
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => geoService.getInitialLocation(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Consumer<Position>(
          builder: (context, value, child) => value != null
              ? Map(value)
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
