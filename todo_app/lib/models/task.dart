class Task {
  final int id;
  String body;
  Status status;

  Task({this.id = -1, this.body = "No Task", this.status = Status.none});
}

enum Status { done, process, archive, none }
