import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

class LocationModel extends Model {
  LatLng _location = LatLng(52.3537269, 9.724127);

  LatLng get location {
    return _location;
  }

  void updateLocation(LatLng newLocation) {
    _location = newLocation;
    notifyListeners();
  }
}