import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    'CAR SERVICE',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.location_on_outlined,
                      size: 40.0,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            child: Text(
              'Bienvenido Edgardo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: Image.asset('assets/car.png'),
                  backgroundColor: Colors.black12,
                  radius: 90,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kilometraje\n5000 km',
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Placas\nHJ2-L3',
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Text(
                          '01',
                          style: TextStyle(fontSize: 40),
                        ),
                        radius: 40,
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      Text('Gruas', style: TextStyle(fontSize: 20))
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Text(
                          '15',
                          style: TextStyle(fontSize: 40),
                        ),
                        radius: 40,
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      Text('Percances', style: TextStyle(fontSize: 20))
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Text(
                          '05',
                          style: TextStyle(fontSize: 40),
                        ),
                        radius: 40,
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      Text('Servicios', style: TextStyle(fontSize: 20))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 90),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, 'services'),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.search,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
