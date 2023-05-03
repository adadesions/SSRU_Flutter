Map<String, double> prices = {"Apple": 599, "Dell": 299, "ASUS": 249};
Map<String, TodoItem> todos = {
  "T0001": TodoItem("T0001", "Teaching flutter", false),
  "T0002": TodoItem("T0002", "Coding", true),
  "T0003": TodoItem("T0003", "Watch an anime", false),
};

class TodoItem {
  String _id;
  String? _task;
  bool _isComplete = false;

  TodoItem(this._id, this._task, this._isComplete);

  void Show() {
    print("----------");
    print("$_id: $_task");
    print("Status: ${_isComplete ? 'Completed' : 'Incomplete'}");
  }
}

void main(List<String> args) {
  // ForEach
  todos.forEach((id, todo) {
    todo.Show();
  });

  List<int> magic = [0, 99, 123];
  magic.forEach(print);
}
