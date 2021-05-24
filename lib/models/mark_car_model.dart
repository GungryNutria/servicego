import 'dart:convert';
import 'package:flutter/material.dart';

class Marks {
  List<Mark> items = [];
  Marks();
  Marks.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final car = new Mark.fromJsonMap(item);
      items.add(car);
    }
  }
}

class Mark {
  String id;
  String marca;

  Mark({this.id, this.marca});

  Mark.fromJsonMap(Map<String, dynamic> json) {
    id = json['id_marca'];
    marca = json['marca'];
  }
}
