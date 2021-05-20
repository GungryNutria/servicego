import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: [titulo(), _botones()],
            ),
          )
        ],
      ),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
    );
    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80.0),
            gradient: LinearGradient(colors: [Colors.black45, Colors.white])),
      ),
    );
    return Stack(
      children: [
        gradiente,
        Positioned(
          top: -100,
          child: cajaRosa,
        )
      ],
    );
  }

  Widget titulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Servicios Viales',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Dinos que servicio quieres que te brindemos',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _botones() {
    return Table(
      children: [
        TableRow(children: [
          _createButton(Colors.white, Icons.car_repair, 'Servicio'),
          _createButton(Colors.white, Icons.directions_bus, 'Grua')
        ]),
        TableRow(children: [
          _createButton(Colors.white, Icons.whatshot_rounded, 'Lavado de Auto'),
          _createButton(
              Colors.white, Icons.radio_button_on_rounded, 'Cambio de Llanta')
        ]),
        TableRow(children: [
          _createButton(
              Colors.white, Icons.miscellaneous_services_sharp, 'Mi Banco'),
          _createButton(Colors.white, Icons.account_box, 'Mi Perfil')
        ]),
      ],
    );
  }

  _createButton(Color color, IconData icon, String text) {
    return InkWell(
      onTap: () {},
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 2.0),
          child: Container(
            height: 160.0,
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.7),
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 20.0),
                CircleAvatar(
                  backgroundColor: color,
                  radius: 35.0,
                  child: Icon(icon, color: Colors.black, size: 30.0),
                ),
                Text(
                  text,
                  style: TextStyle(color: color),
                ),
                SizedBox(height: 20.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
