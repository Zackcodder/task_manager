import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../provider/task_manager_provider.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final int index;

  TaskItem({required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) => taskProvider.toggleTask(index),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            color: Colors.black,
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///edit button
            IconButton(
              icon: Icon(Icons.edit, color: Colors.black),
              onPressed: () =>
                  _showEditTaskDialog(context, taskProvider, task, index),
            ),

            ///deelete button
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => taskProvider.deleteTask(index),
            ),
          ],
        ),
      ),
    );
  }

  
  ///edit task dialog
  void _showEditTaskDialog(
      BuildContext context, TaskProvider taskProvider, Task task, int index) {
    TextEditingController taskController =
        TextEditingController(text: task.title);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Task"),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(hintText: "Update task title"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  taskProvider.editTask(index, taskController.text);
                  Navigator.pop(context);
                }

              
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
