import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicego/bloc/my_map/mapa_bloc.dart';
import 'package:servicego/bloc/my_ubication/my_ubication_bloc.dart';
import 'package:servicego/pages/access_gps_page.dart';
import 'package:servicego/pages/home_page.dart';
import 'package:servicego/pages/loading_page.dart';
import 'package:servicego/pages/login_page.dart';
import 'package:servicego/pages/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MyUbicationBloc()),
        BlocProvider(create: (_) => MapaBloc()),
      ],
      child: MaterialApp(
        title: 'ServiceGo',
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'loading': (BuildContext context) => LoadingPage(),
          'login': (BuildContext context) => LoginPage(),
          'access': (BuildContext context) => AccessPage(),
          'home': (BuildContext context) => HomePage(),
          'register': (BuildContext contesxt) => RegisterPage()
        },
      ),
    );
  }
}
