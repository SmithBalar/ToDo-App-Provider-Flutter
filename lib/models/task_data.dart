import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todo_provider/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Learn'),
    Task(name: 'Code Practice'),
    Task(name: 'Revise'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void addTask(String? newTaskTile) {
    final task = Task(name: newTaskTile);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task? task) {
    task?.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task? task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
