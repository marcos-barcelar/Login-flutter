import 'package:flutter/material.dart';
import 'package:atividade_rotas/components/tasks.dart';
import 'package:atividade_rotas/data/task_dao.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? Key,
    required Widget child,
  }) : super(key: Key, child: child);

  final List<Task> taskList = [

  ];

  void newTask(int id, String name) async {
    TaskDao taskDao = TaskDao();
    int taskId = await taskDao.save(Task(id, name));
    taskList.add(Task(taskId, name));
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
