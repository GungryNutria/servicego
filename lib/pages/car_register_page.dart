import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:servicego/providers/marcas_provider.dart';
import 'package:servicego/models/mark_car_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CarRegisterPage extends StatefulWidget {
  @override
  _CarRegisterPageState createState() => _CarRegisterPageState();
}

class _CarRegisterPageState extends State<CarRegisterPage> {
  String _modelSelected = 'AUDI';
  final _formkey = GlobalKey<FormState>();
  final modelsProvider = new MarksProvider();
  List<Mark> data = [];
  final String uri = "https://carservice007.000webhostapp.com/marcas.php";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(20.0),
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                            child: Text(
                          'DATOS DEL VEHICULO',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                        SizedBox(height: 20.0),
                        _placas(),
                        _models()
                      ],
                    )))
          ],
        ),
      )),
    );
  }

  Widget _placas() {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: HexColor('#000000'))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: HexColor('#000000'))),
            hintText: 'Ingresa tus Placas'),
      ),
    );
  }

  Widget _models() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('DATA'),
          FutureBuilder(
              future: modelsProvider.getMarks(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return DropdownButton(
                    focusColor: Colors.black,
                    value: _modelSelected,
                    items: _getModels(snapshot.data),
                    onChanged: (opt) => setState(() => _modelSelected = opt),
                  );
                } else {
                  return Container(
                      height: 400.0,
                      child: Center(child: CircularProgressIndicator()));
                }
              }),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _getModels(List<Mark> modelos) {
    return modelos.map((e) => DropdownMenuItem(
          child: Text(e.marca),
          value: e.id,
        ));
  }
}
