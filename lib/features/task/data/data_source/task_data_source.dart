import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

import '../../../../core/constants/sql_constants.dart';
import '../../../../core/transformers/task_transformer.dart';
import '../../domain/models/task.dart';
import '../../domain/models/task_type.dart';

abstract class TaskDataSource {
  Future<bool> addTask(Task task);
  Future<bool> deleteTask(Task task);
  Future<bool> deleteTaskById(String id);
  Future<List<Task>?> getAllTask();
  Future<bool> updateTask(Task task);
  Future<List<Task>?> getAllTaskByType(TaskType taskType);
}

class TaskDataSourceAsDatabase extends TaskDataSource {
  Future<Database> _getDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbPath, 'taskly.db'),
      onCreate: (db, version) {
        return db.execute(createTableQuery);
      },
      version: 1,
    );
    return db;
  }

  @override
  Future<bool> addTask(Task task) async {
    final db = await _getDatabase();
    db.insert(tableName, {
      'id': task.id,
      'title': task.title,
      'description': task.description,
      'type': task.type.name,
      'status': task.status.name
    });
    return true;
  }

  @override
  Future<bool> deleteTask(Task task) async {
    deleteTaskById(task.id);
    return true;
  }

  @override
  Future<bool> deleteTaskById(String id) async {
    final db = await _getDatabase();
    db.rawQuery("DELETE FROM $tableName WHERE id = '$id'");
    return true;
  }

  @override
  Future<List<Task>?> getAllTask() async {
    final db = await _getDatabase();
    var allTask = await db.rawQuery('SELECT * from $tableName');

    if (allTask.isEmpty) {
      return [];
    }
    return tansformToTaskList(allTask);
  }

  @override
  Future<bool> updateTask(Task task) async {
    final db = await _getDatabase();
    await db.update(
        tableName,
        {
          'title': task.title,
          'description': task.description,
          'type': task.type.name,
          'status': task.status.name
        },
        where: 'id = ?',
        whereArgs: [task.id]);
    return true;
  }

  @override
  Future<List<Task>> getAllTaskByType(TaskType taskType) async {
    final db = await _getDatabase();
    var allTask = await db
        .rawQuery("SELECT * from $tableName WHERE type = '${taskType.name}'");
    if (allTask.isEmpty) {
      return [];
    }
    return tansformToTaskList(allTask);
  }
}
