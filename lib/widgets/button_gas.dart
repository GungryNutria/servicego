part of 'widgets.dart';

class BtnGas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mapaBloc = context.bloc<MapaBloc>();
    final myUbication = context.bloc<MyUbicationBloc>();

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
          backgroundColor: HexColor('#ffeb3b'),
          child: FlatButton(
            onPressed: () {},
            child: Image.asset('assets/icon4.png'),
            padding: EdgeInsets.all(8.0),
          )),
    );
  }
}
