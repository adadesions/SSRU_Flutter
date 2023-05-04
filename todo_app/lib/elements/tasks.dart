import 'package:flutter/material.dart';

// Models
import '../models/task.dart';

class Tasks extends StatelessWidget {
  final List<Task> taskList;
  final Flags selectedFlag;
  final Function? onChangeCheckbox;

  const Tasks(
      {super.key,
      this.taskList = const <Task>[],
      this.onChangeCheckbox,
      this.selectedFlag = Flags.all});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: taskList.length,
      itemBuilder: (context, index) => Ink(
        // color: Colors.lightBlue,
        child: (taskList[index].flag == selectedFlag) ||
                (selectedFlag == Flags.all)
            ? ListTile(
                leading: Checkbox(
                  shape: const CircleBorder(),
                  checkColor: Colors.white,
                  value: taskList[index].status == Status.done,
                  onChanged: (bool? value) {
                    if (onChangeCheckbox != null) {
                      onChangeCheckbox!(index);
                    }
                  },
                ),
                title: Text(taskList[index].body),
                subtitle: Text(taskList[index].deadline),
                trailing: taskList[index].getIconStatus(),
                onTap: () {},
              )
            : null,
      ),
    );
  }
}
