part of 'mapa_bloc.dart';

@immutable
abstract class MapaEvent {}

class OnMapReady extends MapaEvent {}

class OnNewUbication extends MapaEvent {
  final LatLng ubication;

  OnNewUbication(this.ubication);
}
