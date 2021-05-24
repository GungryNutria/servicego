import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _yearSelected = '2021';
  String _daySelected = '01';
  String _monthSelected = '01';
  final _formKey = GlobalKey<FormState>();
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
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                            child: Text(
                          'DATOS PERSONALES',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                        SizedBox(height: 20.0),
                        _name(),
                        SizedBox(height: 20.0),
                        _last(),
                        SizedBox(height: 20.0),
                        _clave(),
                        SizedBox(height: 20.0),
                        _rClave(),
                        SizedBox(height: 20.0),
                        _email(),
                        SizedBox(height: 20.0),
                        _phone(),
                        SizedBox(height: 20.0),
                        _birth(),
                        SizedBox(height: 20.0),
                        _registerButton(),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _email() {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: HexColor('#000000'))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: HexColor('#000000'))),
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
                borderSide: BorderSide(color: HexColor('#000000'))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: HexColor('#000000'))),
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
                borderSide: BorderSide(color: HexColor('#000000'))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: HexColor('#000000'))),
            hintText: 'Nombre'),
      ),
    );
  }

  Widget _last() {
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
            hintText: 'Apellido'),
      ),
    );
  }

  Widget _clave() {
    return Container(
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: HexColor('#000000'))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: HexColor('#000000'))),
            hintText: 'Contraseña'),
      ),
    );
  }

  Widget _rClave() {
    return Container(
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: HexColor('#000000'))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: HexColor('#000000'))),
            hintText: 'Repetir Contraseña'),
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      width: double.infinity,
      height: 45.0,
      child: ElevatedButton(
        child: Text(
          'Siguiente',
          textAlign: TextAlign.center,
          style: TextStyle(color: HexColor('#FFFFFF')),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)))),
        onPressed: () => Navigator.pushNamed(context, 'carregister'),
      ),
    );
  }

  List<DropdownMenuItem<String>> getDays() {
    List<DropdownMenuItem<String>> lista = [];
    for (int i = 1; i <= 31; i++) {
      if (i < 10) {
        String dia = '0' + i.toString();
        lista.add(DropdownMenuItem(child: Text(dia), value: dia));
      } else {
        lista.add(
            DropdownMenuItem(child: Text(i.toString()), value: i.toString()));
      }
    }
    return lista;
  }

  List<DropdownMenuItem<String>> getMonths() {
    List<DropdownMenuItem<String>> lista = [];
    for (int i = 1; i <= 12; i++) {
      if (i < 10) {
        String mes = '0' + i.toString();
        lista.add(DropdownMenuItem(child: Text(mes), value: mes));
      } else {
        lista.add(
            DropdownMenuItem(child: Text(i.toString()), value: i.toString()));
      }
    }
    return lista;
  }

  List<DropdownMenuItem<String>> getYears() {
    List<DropdownMenuItem<String>> lista = [];
    for (int i = 1900; i <= 2021; i++) {
      lista.add(
          DropdownMenuItem(child: Text(i.toString()), value: i.toString()));
    }
    return lista;
  }

  Widget _birth() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fecha de Nacimiento',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_days(), _months(), _years()],
          )
        ],
      ),
    );
  }

  Widget _days() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dia'),
          DropdownButton(
            focusColor: Colors.black,
            value: _daySelected,
            items: getDays(),
            onChanged: (opt) => setState(() => _daySelected = opt),
          )
        ],
      ),
    );
  }

  Widget _months() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mes'),
          DropdownButton(
            focusColor: Colors.black,
            value: _monthSelected,
            items: getMonths(),
            onChanged: (opt) => setState(() => _monthSelected = opt),
          )
        ],
      ),
    );
  }

  Widget _years() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Año'),
          DropdownButton(
            focusColor: Colors.black,
            value: _yearSelected,
            items: getYears(),
            onChanged: (opt) => setState(() => _yearSelected = opt),
          )
        ],
      ),
    );
  }
}
