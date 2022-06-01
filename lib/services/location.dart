import 'package:geolocator/geolocator.dart';

class Location {
  late double longitude, latitude;

  Future<void> getCurrentLocation() async {
    Position? position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
