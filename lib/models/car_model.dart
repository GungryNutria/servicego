class Cars {
  List<Car> items = [];

  Cars();

  Cars.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final car = new Car.fromJsonMap(item);
      items.add(car);
    }
  }
}

class Car {
  String year;
  String make;
  String model;

  Car({this.year, this.make, this.model});

  Car.fromJsonMap(Map<String, dynamic> json) {
    year = json['year'];
    make = json['make'];
    model = json['model'];
  }
}
