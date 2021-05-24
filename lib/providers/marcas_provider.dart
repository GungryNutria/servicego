import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:servicego/models/mark_car_model.dart';

class MarksProvider {
  String _url = "https://carservice007.000webhostapp.com";

  Future<List<Mark>> _processResults(Uri url) async {
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final marcas = new Marks.fromJsonList(decodeData['results']);
    print(marcas.items);
    return marcas.items;
  }

  Future<List<Mark>> getMarks() async {
    Uri url = new Uri.https(_url, 'marca.php');
    print(url);
    return await _processResults(url);
  }
}
