import 'package:sqflite/sqflite.dart';
import '';
import 'package:atividade_rotas/data/database.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$_name TEXT,)';

  static const String _tableName = 'taskTable';
  static const String _id = 'id';
  static const String _name = 'name';
}