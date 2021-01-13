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
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    _home(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: School',
      style: optionStyle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        color: HexColor('#ff0000'),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Scaffold(
              body: _widgetOptions.elementAt(_selectedIndex),
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.assignment_turned_in),
                    label: 'servicios',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: 'Buscar'),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_box_rounded),
                    label: 'Cuenta',
                  ),
                ],
                unselectedItemColor: Colors.grey[500],
                currentIndex: _selectedIndex,
                selectedItemColor: HexColor('#ff0000'),
                onTap: _onItemTapped,
              ),
            )
          ],
        ));
  }

  static Widget _home() {
    return CustomScrollView(slivers: [
      SliverAppBar(
        elevation: 2.0,
        backgroundColor: HexColor('#ff0000'),
        expandedHeight: 100.0,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: EdgeInsets.all(0.0),
            title: Text('ServiceGo')),
      )
    ]);
  }
}
