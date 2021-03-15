import 'package:geolocator/geolocator.dart';

class MyLocation {
  var locationMessage = "";
  String getMyLocation() {
    var position =
        Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    var lastPosition = Geolocator.getLastKnownPosition();
    print(lastPosition);

    return locationMessage = "$position.altitude, $position.longitude";
  }
}
