import 'package:pickaboo/core/location_permission_status.dart';

abstract class IPermissionService {
  Stream<bool> get locationServicesStatusStream;
  Future<bool> isLocationPermissionGranted();
  Future<bool> isLocationServicesEnabled();
  Future<void> openAppSettings();
  Future<void> openLocationSettings();
  Future<LocationPermissionStatus> requestLocationPermission();
}
