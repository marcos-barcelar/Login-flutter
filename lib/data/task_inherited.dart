import 'package:flutter/material.dart';
import 'package:atividade_rotas/components/tasks.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? Key,
    required Widget child,
  }) : super(key: Key, child: child);

  final List<Task> taskList = [
    Task(1, 'teste'),
  ];

  void newTask(int id, String name){
    taskList.add(Task(id,name));
  }
  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
    context.dependOnInheritedWidgetOfExactType<TaskInherited>();

    assert(result != null, 'No  found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
