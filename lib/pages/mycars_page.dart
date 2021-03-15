import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyCarPage extends StatefulWidget {
  MyCarPage({Key key}) : super(key: key);

  @override
  _MyCarPageState createState() => _MyCarPageState();
}

class _MyCarPageState extends State<MyCarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F1F1F1'),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Mis Carros',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          iconSize: 30,
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [_selectedCar(), _unselectedCar()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.black,
          onPressed: () => Navigator.pushNamed(context, 'newcar')),
    );
  }

  Widget _selectedCar() {
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ListTile(
          leading: Image(image: AssetImage('assets/mycar.png')),
          title: Text('Nissan Sentra'),
          subtitle: Text('Modelo: 2017'),
          trailing: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 30,
              )),
        ));
  }

  Widget _unselectedCar() {
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: ListTile(
          leading: Image(image: AssetImage('assets/mycar.png')),
          title: Text('Chevrolet Camaro'),
          subtitle: Text('Modelo: 2021'),
          trailing: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.check,
                color: Colors.black,
                size: 30,
              )),
        ));
  }
}
