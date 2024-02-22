import 'package:flutter/material.dart';
import 'package:atividade_rotas/data/task_dao.dart';
import 'package:atividade_rotas/screen/register_screen.dart';

class Task extends StatefulWidget{
  final int id;
  final String name;

  Task(this.id, this.name, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('id: ${widget.id}, name: ${widget.name}'),
    );
  }
}

