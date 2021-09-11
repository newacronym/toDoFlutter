import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskdata.tasks[index];
            return TaskTile(
                taskTitle: task.taskName,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  taskdata.updateTask(task);
                },
            longpressCallback: (){
                  print('Long pressed');
                  taskdata.removeTask(task);
            },);
          },
          itemCount: taskdata.taskCount,
        );
      },
    );
  }
}
