import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String clave;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Center(
        child: ListView(
          children: [
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/logo.png',
                  height: 300,
                  width: 300,
                )),
            Container(
                child: Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _email(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _password(),
                    _forgotPassword(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _loginbutton(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Ó'),
                    SizedBox(
                      height: 20.0,
                    ),
                    _registerButton()
                  ],
                ),
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
        textAlign: TextAlign.center,
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

  Widget _password() {
    return Container(
      child: TextFormField(
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: HexColor('#ff0000'))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: HexColor('#ff0000'))),
            hintText: 'Contrasaeña'),
      ),
    );
  }

  Widget _forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('¿Olvidaste tu Contraseña?'),
        Container(
          child: FlatButton(
            child: Text(
              'Click Aqui',
              style: TextStyle(color: HexColor('#ff0000')),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  Widget _loginbutton() {
    return Container(
      width: double.infinity,
      height: 45.0,
      child: RaisedButton(
        child: Text(
          'Iniciar Sesion',
          textAlign: TextAlign.center,
          style: TextStyle(color: HexColor('#FFFFFF')),
        ),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)),
        color: HexColor('#ff0000'),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'home');
        },
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      width: double.infinity,
      height: 45.0,
      child: RaisedButton(
        child: Text(
          'Registrarme',
          textAlign: TextAlign.center,
          style: TextStyle(color: HexColor('#FFFFFF')),
        ),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)),
        color: HexColor('#ff0000'),
        onPressed: () => Navigator.pushNamed(context, 'register'),
      ),
    );
  }
}
