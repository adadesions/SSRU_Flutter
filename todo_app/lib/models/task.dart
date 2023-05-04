class Task {
  final int id;
  String body;
  String deadline;
  Status status;
  Flags flag;

  Task(
      {this.id = -1,
      this.body = "No Task",
      this.deadline = "dd/mm/yyyy",
      this.status = Status.none,
      this.flag = Flags.none});
}

enum Status { done, process, archive, none }

enum Flags { personal, work, school, social, none }
