import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocation/geolocation.dart';

class PermissionProvider extends ChangeNotifier {
  bool isPermissionGiven = false;

  Future<Void> checkPermission() async {
    final GeolocationResult result =
        await Geolocation.requestLocationPermission(
            permission: const LocationPermission(
              android: LocationPermissionAndroid.fine,
              ios: LocationPermissionIOS.always,
            ),
            openSettingsIfDenied: true);

    if (result.isSuccessful) {
      isPermissionGiven = true;
      notifyListeners();
    } else {
      print('location permission is not given');
    }
  }
}
