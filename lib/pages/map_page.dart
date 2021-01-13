import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:servicego/bloc/my_map/mapa_bloc.dart';
import 'package:servicego/bloc/my_ubication/my_ubication_bloc.dart';
import 'package:servicego/widgets/widgets.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    context.bloc<MyUbicationBloc>().iniciarSeguimiento();
    super.initState();
  }

  @override
  void dispose() {
    context.bloc<MyUbicationBloc>().cancelarSeguimineto();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BlocBuilder<MyUbicationBloc, MyUbicationState>(
                builder: (_, state) => createMap(state))),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [BtnLocation()],
        ));
  }

  Widget createMap(MyUbicationState state) {
    if (!state.existUbication) return Text('Localizando...');

    final mapBloc = BlocProvider.of<MapaBloc>(context);

    final camaraPosition =
        new CameraPosition(target: state.ubication, zoom: 15);
    return GoogleMap(
        initialCameraPosition: camaraPosition,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: mapBloc.initMap);
  }
}
