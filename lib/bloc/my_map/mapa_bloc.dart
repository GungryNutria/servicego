import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meta/meta.dart';
import 'package:servicego/themes/map_theme.dart';

part 'mapa_event.dart';
part 'mapa_state.dart';

class MapaBloc extends Bloc<MapaEvent, MapaState> {
  MapaBloc() : super(MapaState());
  //controlador del mapa
  GoogleMapController _controller;

  //Polylines
  Polyline _miRuta = new Polyline(
    polylineId: PolylineId('mi_ruta'),
    color: HexColor('#ff0000'),
    width: 4,
  );

  void initMap(GoogleMapController controller) {
    if (!state.mapReady) {
      this._controller = controller;
      this._controller.setMapStyle(jsonEncode(mapTheme));
      add(OnMapReady());
    }
  }

  void moveCamera(LatLng destino) {
    final cameraUpdate = CameraUpdate.newLatLng(destino);
    this._controller?.animateCamera(cameraUpdate);
  }

  @override
  Stream<MapaState> mapEventToState(MapaEvent event) async* {
    if (event is OnMapReady) {
      yield state.copyWith(mapReady: true);
    } else if (event is OnNewUbication) {
      yield* this._onNewUbication(event);
    }
  }

  Stream<MapaState> _onNewUbication(OnNewUbication event) async* {
    final points = [...this._miRuta.points, event.ubication];
    this._miRuta = this._miRuta.copyWith(pointsParam: points);

    final currentPolylines = state.polylines;
    currentPolylines['mi_ruta'] = this._miRuta;
    yield state.copyWith(polylines: currentPolylines);
  }
}
