import 'package:flutter/material.dart';

// Models
import '../models/task.dart';

class Tasks extends StatelessWidget {
  final List<Task> taskList;
  final Function? onChangeCheckbox;

  const Tasks({
    super.key,
    this.taskList = const <Task>[],
    this.onChangeCheckbox,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, index) => Ink(
        // color: Colors.lightBlue,
        child: ListTile(
          leading: Checkbox(
            checkColor: Colors.white,
            value: taskList[index].status == Status.done,
            onChanged: (bool? value) {
              if (onChangeCheckbox != null) {
                onChangeCheckbox!(index);
              }
            },
          ),
          title: Text(taskList[index].body),
          subtitle: Text(taskList[index].status.toString()),
          onTap: () {},
        ),
      ),
    );
  }
}
