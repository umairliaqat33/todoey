import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TasksData extends ChangeNotifier {

  String nextTaskDescription = '';

  List<Task> _tasks = [
    Task('Buy milk',false),
    Task('Buy eggs',false),
    Task('Buy bread',false)
  ];

  void setNextTaskDescription(String description) {
    nextTaskDescription = description;
  }

  void addTask() {
    _tasks.add(Task(nextTaskDescription,true));
    nextTaskDescription = '';
    notifyListeners();
  }

  int get totalCount { return _tasks.length; }

  int get taskCount {
    int ret = 0;
    for (Task t in _tasks) {
      if (!t.isDone) ++ret;
    }
    return ret;
  }

  Task getAt(int index) {
    return _tasks[index];
  }

  void deleteAt(int index) {
    if (index < 0 || index >= _tasks.length) return;
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleDone(Task t) {
    t.toggleDone();
    notifyListeners();
  }
}