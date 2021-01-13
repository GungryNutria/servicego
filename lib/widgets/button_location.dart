part of 'widgets.dart';

class BtnLocation extends StatelessWidget {
  const BtnLocation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapaBloc = context.bloc<MapaBloc>();
    final myUbication = context.bloc<MyUbicationBloc>();

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: HexColor('#ffeb3b'),
        child: IconButton(
          icon: Icon(Icons.my_location, color: Colors.white),
          onPressed: () {
            final destino = myUbication.state.ubication;
            mapaBloc.moveCamera(destino);
          },
        ),
      ),
    );
  }
}
