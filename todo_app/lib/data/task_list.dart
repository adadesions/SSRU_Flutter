import '../models/task.dart';

List<Task> taskList = [
  Task(
      id: 0,
      body: 'Teaching states in flutter',
      status: Status.process,
      deadline: "04/05/2023",
      flag: Flags.personal),
  Task(
      id: 1,
      body: 'Implementing user authentication',
      status: Status.done,
      deadline: "05/31/2023",
      flag: Flags.work),
  Task(
      id: 2,
      body: 'Creating a responsive UI design',
      status: Status.done,
      deadline: "06/15/2023",
      flag: Flags.personal),
  Task(
      id: 3,
      body: 'Testing app on multiple devices',
      status: Status.none,
      deadline: "07/07/2023",
      flag: Flags.work),
  Task(
      id: 4,
      body: 'Preparing for presentation',
      status: Status.archive,
      deadline: "07/15/2023",
      flag: Flags.work)
];
