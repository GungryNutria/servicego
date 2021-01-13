part of 'mapa_bloc.dart';

@immutable
class MapaState {
  final bool mapReady;
  final bool drawRide;

  final Map<String, Polyline> polylines;

  MapaState(
      {this.mapReady = false,
      this.drawRide = false,
      Map<String, Polyline> polylines})
      : this.polylines = polylines ?? new Map();

  MapaState copyWith(
          {bool mapReady, bool drawRide, Map<String, Polyline> polylines}) =>
      MapaState(
          mapReady: mapReady ?? this.mapReady,
          drawRide: drawRide ?? this.drawRide,
          polylines: polylines ?? this.polylines);
}
