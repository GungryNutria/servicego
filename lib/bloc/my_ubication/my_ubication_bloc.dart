import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:meta/meta.dart';
import 'package:geolocator/geolocator.dart' as Geolocator;

part 'my_ubication_event.dart';
part 'my_ubication_state.dart';

class MyUbicationBloc extends Bloc<MyUbicationEvent, MyUbicationState> {
  MyUbicationBloc() : super(MyUbicationState());
  StreamSubscription<Geolocator.Position> _positionSubscription;
  void iniciarSeguimiento() {
    this._positionSubscription = Geolocator.getPositionStream(
            desiredAccuracy: LocationAccuracy.high, distanceFilter: 10)
        .listen((Geolocator.Position position) {
      final newLocation = new LatLng(position.latitude, position.longitude);
      add(OnUbicationChange(newLocation));
    });
  }

  void cancelarSeguimineto() {
    this._positionSubscription.cancel();
  }

  @override
  Stream<MyUbicationState> mapEventToState(
    MyUbicationEvent event,
  ) async* {
    if (event is OnUbicationChange) {
      yield state.copyWith(existUbication: true, ubication: event.ubicacion);
    }
  }
}
