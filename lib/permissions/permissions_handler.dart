import 'package:permission_handler/permission_handler.dart';

Future<bool> checkLocationPermission() async {
  final status = await Permission.location.status;
  return status.isGranted;
}

Future<void> requestLocationPermission() async {
  final status = await Permission.location.request();
  if (status.isDenied) {
    await Permission.location.request();
  }
  final locationGranted = await Permission.location.isGranted;
}