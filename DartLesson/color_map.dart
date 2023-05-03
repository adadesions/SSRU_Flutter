// print(circle.toString());
// OUTPUT: "Shape: Circle, Radius: 1.0, Color: 'Red'"

enum Colors { red, green, blue }

void main(List<String> args) {
  Colors color = Colors.red;
  ColorCode(color);
  print(Colormap[Colors.green]);
}

Map<Colors, String> Colormap = {
  Colors.red: "#FF0000",
  Colors.blue: "#0000FF",
  Colors.green: "#00FF00"
};

void ColorCode(Colors color) {
  switch (color) {
    case Colors.red:
      print("#FF0000");
      break;
    case Colors.blue:
      print("#0000FF");
      break;
    case Colors.green:
      print("#00FF00");
      break;
  }
}
