import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/database_service.dart';
import '../services/notification_service.dart';

class TaskProvider extends ChangeNotifier {
  final DatabaseService _dbService = DatabaseService();
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  TaskProvider() {
    _loadTasks();
  }

  // Load tasks from Hive
  void _loadTasks() {
    _tasks = _dbService.getTasks();
    notifyListeners();
  }

  // Add a new task
  // Add a new task
  Future<void> addTask(String title, String description) async {
    final task = Task(
      title: title,
      description: description, // ✅ Required field added
      isCompleted: false, // ✅ Default value
    );

    await _dbService.addTask(task);
    _loadTasks(); // Reload tasks

    // Schedule notification 5 minutes later
    await NotificationService().showInstantNotification(task.hashCode, title);
    // .scheduleTaskNotification(task.hashCode, title);
  }

  // Toggle task completion
  Future<void> toggleTask(int index) async {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    await _dbService.updateTask(index, _tasks[index]);
    notifyListeners();
  }

  // Delete a task
  Future<void> deleteTask(int index) async {
    await _dbService.deleteTask(index);
    _loadTasks();
  }
}
