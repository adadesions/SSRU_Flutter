// print(circle.toString());
// OUTPUT: "Shape: Circle, Radius: 1.0, Color: 'Red'"
import 'dart:math';

enum Colors { red, green, blue }

Map<Colors, String> ColorsMap = {
  Colors.red: "Red",
  Colors.blue: "Blue",
  Colors.green: "Green"
};

class Circle {
  double _radius = 1.0;
  Colors _color = Colors.red;

  Circle();
  Circle.withRadius(this._radius);

  double GetRadius() {
    return this._radius;
  }

  double GetArea() {
    return pi * _radius * _radius;
  }

  String toString() {
    return "Shape: Circle, Radius: $_radius, Color: ${ColorsMap[_color]}";
  }
}

class Cylinder extends Circle {
  double _height = 1.0;

  Cylinder();
  Cylinder.withRadius(double radius) : super.withRadius(radius);
  Cylinder.withHeight(double radius, double height) {
    super._radius = radius;
    this._height = height;
  }

  double GetHeight() {
    return _height;
  }

  double GetVolume() {
    return super.GetArea() * this._height;
  }

  @override
  String toString() {
    return "Shape: Cylinder, Radius: $_radius, Height: $_height Color: ${ColorsMap[_color]}";
  }
}

void main(List<String> args) {
  var c1 = Circle();
  var c2 = Circle.withRadius(5);

  print(c1.toString());
  print(c2.toString());

  var cy1 = Cylinder();
  print(cy1.toString());
  print("Volume: ${cy1.GetVolume()}");

  var cy2 = Cylinder.withHeight(5, 10);
  print(cy2.toString());
  print("Volume: ${cy2.GetVolume()}");
}
