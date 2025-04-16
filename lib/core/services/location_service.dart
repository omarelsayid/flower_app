import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  Future<bool> checkAndRequsetLocationService() async {
    bool locationServiceEnabled = await location.serviceEnabled();
    if (!locationServiceEnabled) {
      locationServiceEnabled = await location.requestService();
      if (!locationServiceEnabled) {
        throw LocationServiceException();
      }
    }
    return true;
  }

  Future<bool> checkAndRequsetLocationPermesion() async {
    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      PermissionStatus permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        throw LocationPermissionException();
      }
    }
    if (permissionStatus == PermissionStatus.deniedForever)
      throw LocationPermissionException();

    return true;
  }

  Future<LocationData> getUserLocation() async {
    await checkAndRequsetLocationService();
    await checkAndRequsetLocationPermesion();
    return await location.getLocation();
  }
}

class LocationPermissionException implements Exception {}

class LocationServiceException implements Exception {}
