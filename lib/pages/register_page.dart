import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/logo.png',
                )),
            Container(
                margin: EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _email(),
                      SizedBox(height: 20.0),
                      _phone(),
                      SizedBox(height: 20.0),
                      _name(),
                      SizedBox(height: 20.0),
                      _clave(),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _email() {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: HexColor('#ff0000'))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: HexColor('#ff0000'))),
            hintText: 'Correo Electronico'),
      ),
    );
  }

  Widget _phone() {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: HexColor('#ff0000'))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: HexColor('#ff0000'))),
            hintText: 'Numero Celular'),
      ),
    );
  }

  Widget _name() {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: HexColor('#ff0000'))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: HexColor('#ff0000'))),
            hintText: 'Usuario o Establecimiento'),
      ),
    );
  }

  Widget _clave() {
    return Container(
      child: TextFormField(
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: HexColor('#9ad3bc'))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: HexColor('#ec524b'))),
            hintText: 'Contraseña'),
      ),
    );
  }
}
