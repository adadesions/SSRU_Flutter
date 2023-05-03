void main() {
  print("Hello, world!");

  String name = "AdaBrain";
  print("Hello, $name");
  print("Hello2, " + name);

  int age = 24;
  print("Age: " + age.toString());
  print("Dad age: ${age + 30}");

  print(5 / 2);
  print(5 ~/ 2);

  List<String> names = ["Ada", "Peter", "Strange", "Thor"];
  greetingList(names);
}

void greetingList(List<String> names) {
  for (String name in names) {
    greeting(name);
  }
}

void greeting(String name) {
  print("Greeting: $name");
}
