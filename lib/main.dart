import 'package:flutter/material.dart';
import 'package:servicego/pages/home_page.dart';
import 'package:servicego/pages/login_page.dart';
import 'package:servicego/pages/mycars_page.dart';
import 'package:servicego/pages/newcar_page.dart';
import 'package:servicego/pages/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ServiceGo',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
        'register': (BuildContext contesxt) => RegisterPage(),
        'mycars': (BuildContext context) => MyCarPage(),
        'newcar': (BuildContext context) => NewCarPage()
      },
    );
  }
}
