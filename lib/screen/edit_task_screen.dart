import 'package:flutter/material.dart';
import 'package:atividade_rotas/components/tasks.dart';
import 'package:atividade_rotas/data/task_dao.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;

  const EditTaskScreen({Key? key, required this.task}) : super(key: key);

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.task.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Tarefa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nome da Tarefa',
              ),
              controller: _nameController,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _saveEditedTask();
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveEditedTask() async {
    final String newName = _nameController.text;
    final Task editedTask = Task(widget.task.id, newName);
    await TaskDao().update(editedTask, newName);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
