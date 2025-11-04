import 'package:geolocator/geolocator.dart';
import 'notification_service.dart';

class LocationService {
  static Future<bool> _handlePermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return false;
    }
    return true;
  }

  static void startGeofenceMonitoring(String locationName, double lat, double lng, String task) async {
    if (!await _handlePermission()) return;

    const double radius = 100; // metros

    Geolocator.getPositionStream(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 10),
    ).listen((Position position) {
      double distance = Geolocator.distanceBetween(
        position.latitude, position.longitude, lat, lng,
      );

      if (distance <= radius) {
        NotificationService.showScheduled(
          id: task.hashCode,
          title: "¡Estás en $locationName!",
          body: task,
          scheduledDate: DateTime.now(),
        );
        // Opcional: eliminar geofence tras activación
      }
    });
  }
}