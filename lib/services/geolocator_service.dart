import 'package:geolocator/geolocator.dart';

class GeolocatorServiceAbuAli {
  final GeolocatorPlatform geo = GeolocatorPlatform.instance;

  Stream<Position> getCurrentLocation() {
    // var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    return geo.getPositionStream(desiredAccuracy: LocationAccuracy.high, distanceFilter: 10);
  } //end of getCurrentLocation function

  Future<Position> getInitialLocation() {
    return geo.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
} //end of class
