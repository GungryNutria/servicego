import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NewCarPage extends StatefulWidget {
  NewCarPage({Key key}) : super(key: key);

  @override
  _NewCarPageState createState() => _NewCarPageState();
}

class _NewCarPageState extends State<NewCarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F1F1F1'),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Agregar Carro',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Container(
        child: Text('Hola mundo'),
      ),
    );
  }
}
