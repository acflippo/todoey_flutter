import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';
// import 'dart:collection';

class TaskData extends ChangeNotifier {
  // make the list private to force other class to interact with it using functions
  List<Task> _tasks = [
    Task(name: 'Buy Soy Milk'),
    Task(name: 'Buy Yogurt'),
    Task(name: 'Car Payment'),
    Task(name: 'Do Yoga'),
    // Task(name: 'Update Windows'),
    // Task(name: 'Oil Squeaky Wheel'),
    // Task(name: 'Buy Pancakes'),
    // Task(name: 'Buy Nuts'),
    // Task(name: 'Buy Ice Cream'),
    // Task(name: 'Peel Carrots'),
    // Task(name: 'Buy Beans'),
    // Task(name: 'Buy Eggs'),
    // Task(name: 'Oil Change'),
    // Task(name: 'Get Money from ATM'),
    // Task(name: 'Buy Paper Towels'),
    // Task(name: 'Buy Chocolate'),
    // Task(name: 'Buy Soy Butter'),
  ];

  // Make an unmodifiable list so other class cannot do tasks.add(xxx)
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

}