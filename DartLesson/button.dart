class Button {
  String? _text;
  double width = 100;
  double height = 100;

  Button(this._text, this.width, this.height);

  String? get Text {
    _text ??= "Untitled";
    return _text;
  }
}

class SubmitButton extends Button {
  Colors color = Colors.green;

  SubmitButton(super.text, super.width, super.height);

  void Submit() {
    print("Pressed submit button");
    color = Colors.yellow;
  }
}

enum Colors { green, red, blue, yellow }

void main(List<String> args) {
  var btn = Button(null, 120, 50);
  print(btn.Text);

  var submitBtn = SubmitButton("Send", 100, 30);
  submitBtn.Submit();

  // Final vs Const
  final double width = btn.width; // runTime
  const int height = 199;   // compiledTime
}
