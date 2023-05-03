// class = bluePrint
class GameConsole {
  // Fields
  int _controllers = 0; // Private modifier "_" as a prefix
  double _power = 0.0;
  String name = "Untitled";

  // Properties
  int get Controller {
    return _controllers;
  }

  void set Controller(int value) {
    this._controllers = value;
  }

  // Constructor
  GameConsole(this.name, this._power, this._controllers);

  // Methods
  void Print() {
    print("==========");
    print("Console name: $name");
    print("Maximum controllers: $_controllers");
    print("Power supply: $_power");
    print("Electricity: ${CalElectricityPerDay(1.5)} THB/day");
    print("==========");
  }

  double CalElectricityPerDay(double multipler) {
    return _power * multipler + 100;
  }
}

void main(List<String> args) {
  GameConsole ps5 = GameConsole("PS5", 120.35, 2);
  ps5.Print();
  print(ps5._power);

  var xbox = GameConsole("Xbox", 150, 4);
  xbox.Print();

  xbox.Controller = 2;
  xbox.Print();
}
