import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:servicego/bloc/my_map/mapa_bloc.dart';
import 'package:servicego/bloc/my_ubication/my_ubication_bloc.dart';
import 'package:servicego/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> getDisplay(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      _home(context),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
      _account()
    ];
    return _widgetOptions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#F1F1F1'),
        body: Stack(
          children: [getDisplay(context).elementAt(_selectedIndex)],
        ),
        bottomNavigationBar: _bottomMenu());
  }

  static Widget _home(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 15.0),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'ServiceGo',
                        style: optionStyle,
                      )),
                  Container(
                    margin: EdgeInsets.only(right: 15.0),
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _option('opcion1', 'Llanta'),
                  _option('opcion2', 'Grua'),
                  _option('opcion3', 'Lavado'),
                  _option('opcion4', 'Servicio'),
                  _option('opcion4', 'Servicio')
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Recientes',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                _compra('opcion1', 'Cambio de Neumatico a domicilio', '150.00'),
                _compra('opcion2', 'Solicitud de grua', '200.0'),
                _compra('opcion3', 'Lavado de Auto tamaño mediano', '100.0'),
                _compra('opcion4', 'Servicio Automotriz a domicilio', '200.0'),
                _compra('opcion2', 'Solicitud de grua', '200.0'),
                _compra('opcion2', 'Solicitud de grua', '200.0'),
                _compra('opcion2', 'Solicitud de grua', '200.0'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _option(String opcion, String text) {
    return FlatButton(
        onPressed: () {},
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/$opcion.png'),
              width: 50.0,
            ),
            Text(text)
          ],
        ));
  }

  Widget _bottomMenu() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box_rounded),
          label: 'Cuenta',
        ),
      ],
      unselectedItemColor: Colors.grey[500],
      currentIndex: _selectedIndex,
      selectedItemColor: HexColor('#171717'),
      onTap: _onItemTapped,
    );
  }

  static Widget _compra(String opcion, String descripcion, String monto) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      child: ListTile(
        leading: Image(image: AssetImage('assets/$opcion.png')),
        title: Text(descripcion),
        trailing: FlatButton(
            onPressed: () {},
            child: Text('Ver Detalles'),
            color: Colors.black,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0))),
      ),
    );
  }

  Widget _account() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    child: Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text('Edgardo Reyes'),
                    leading: Icon(
                      Icons.account_circle,
                      size: 30.0,
                      color: Colors.black,
                    ),
                  ),
                ))
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    title: Text('COVID-19 Centro de seguridad'),
                    leading: Icon(
                      Icons.shield,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Mis carros'),
                    leading: Icon(
                      Icons.car_rental,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Pago'),
                    leading: Icon(
                      Icons.credit_card_outlined,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Direcciones'),
                    leading: Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Tus favoritos'),
                    leading: Icon(
                      Icons.star_border,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Configuración'),
                    leading: Icon(
                      Icons.settings_outlined,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Ayuda'),
                    leading: Icon(
                      Icons.help_outline_outlined,
                      color: Colors.black,
                      size: 30.0,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
