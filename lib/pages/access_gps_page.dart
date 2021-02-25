import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:permission_handler/permission_handler.dart';

class AccessPage extends StatefulWidget {
  const AccessPage({Key key}) : super(key: key);

  @override
  _AccessPageState createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (await Permission.location.isGranted) {
        Navigator.pushReplacementNamed(context, 'loading');
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Es necesario el gps para usar la app'),
            MaterialButton(
              child: Text('Solicitar Acceso',
                  style: TextStyle(color: Colors.white)),
              color: HexColor('#9ad3bc'),
              shape: StadiumBorder(),
              elevation: 0,
              splashColor: Colors.transparent,
              onPressed: () async {
                final status = await Permission.location.request();
                this.accesoGPS(status);
              },
            )
          ],
        ),
      ),
    );
  }

  void accesoGPS(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
        Navigator.pushReplacementNamed(context, 'home');
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.undetermined:
        openAppSettings();
        break;
      case PermissionStatus.limited:
        // TODO: Handle this case.
        break;
    }
  }
}
