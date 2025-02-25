import 'package:hive/hive.dart';

part 'task_model.g.dart'; // Hive generates this file

@HiveType(typeId: 0) // Unique ID for this adapter
class Task extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}
