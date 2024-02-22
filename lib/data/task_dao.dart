import 'package:sqflite/sqflite.dart';
import 'package:atividade_rotas/components/tasks.dart';
import 'package:atividade_rotas/data/database.dart';

class TaskDao {
  static const String _tableName = 'taskTable';
  static const String _id = 'id';
  static const String _name = 'name';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$_name TEXT)';

  Future<int> save(Task tarefa) async {
    print('Iniciando o save: ');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.id);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      print('Tarefa não existia.');
      return await bancoDeDados.insert(
        _tableName,
        taskMap,
      );
    } else {
      print('Tarefa já existia.');
      return await bancoDeDados.update(
        _tableName,
        taskMap,
        where: '$_id = ?',
        whereArgs: [tarefa.id],
      );
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo tarefa em Map: ');
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_id] = tarefa.id;
    mapaDeTarefas[_name] = tarefa.name;
    print('Mapa de Tarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(_tableName);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to List:');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_id], linha[_name]);
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas $tarefas');
    return tarefas;
  }

  Future<List<Task>> find(int taskId) async {
    print('Acessando o find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tableName,
      where: '$_id = ?',
      whereArgs: [taskId],
    );
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  Future<int> update(Task task, String novoNomeDaTarefa) async {
    print('Editando a tarefa: ${task.id} para $novoNomeDaTarefa');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.update(
      _tableName,
      {
        _name: novoNomeDaTarefa,
      },
      where: '$_id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> delete(int taskId) async {
    print('Deletando a tarefa com ID: $taskId');
    final Database bancoDeDados = await getDatabase();
    await bancoDeDados.delete(
      _tableName,
      where: '$_id = ?',
      whereArgs: [taskId],
    );
  }
}
