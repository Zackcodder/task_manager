import 'package:hive/hive.dart';
import '../models/task_model.dart';

class DatabaseService {
  static final _taskBox = Hive.box<Task>('tasks');

  // Add a new task
  Future<void> addTask(Task task) async {
    await _taskBox.add(task);
  }

  // Fetch all tasks
  List<Task> getTasks() {
    return _taskBox.values.toList();
  }

  // Update a task
  Future<void> updateTask(int index, Task task) async {
    await _taskBox.putAt(index, task);
  }

  // Delete a task
  Future<void> deleteTask(int index) async {
    await _taskBox.deleteAt(index);
  }
}
