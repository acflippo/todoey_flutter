import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      // this builder method is creating an object called taskData
      // where taskData is synonymous to Provider.of<TaskData>(context)
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final currentTask = taskData.tasks[index];
            return TaskTile(
              taskTitle: currentTask.name,
              isChecked: currentTask.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(currentTask);
            },
              longPressCallback: () {
                taskData.deleteTask(currentTask);
            },
          );
        },
        itemCount: taskData.taskCount,
        );
      },
    );
  }
}
