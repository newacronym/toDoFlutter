import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [git];
  // a list so that we cant use to add items just by calling the tasks ,but we can view and take item from tasks
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskName) {
    if(newTaskName == null){
      newTaskName = "nothing";
    }
    final task = Task(taskName: newTaskName);
    _tasks.add(task);
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }
  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }
  void removeTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}
