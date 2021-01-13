import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geoLocator;
import 'package:permission_handler/permission_handler.dart';
import 'package:servicego/helpers/helpers.dart';
import 'package:servicego/pages/home_page.dart';

import 'access_gps_page.dart';
import 'login_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (await Permission.location.isGranted) {
        Navigator.pushReplacementNamed(context, 'login');
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: this.checkGpsAndLocation(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Text(snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  Future checkGpsAndLocation(BuildContext context) async {
    final permisoGPS = await Permission.location.isGranted;
    final gpsActivo = await geoLocator.isLocationServiceEnabled();
    if (permisoGPS && gpsActivo) {
      Navigator.pushReplacement(
          context, navegarMapaFadeIn(context, HomePage()));
      return '';
    } else if (!permisoGPS) {
      Navigator.pushReplacement(
          context, navegarMapaFadeIn(context, AccessPage()));
      return 'Falta permiso del gps';
    } else {
      return 'Activar GPS';
    }
    //Navigator.pushReplacement(context, navegarMapaFadeIn(context, AccessPage()));
  }
}
