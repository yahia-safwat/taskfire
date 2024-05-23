import '../../domain/models/task.dart';
import '../../domain/models/task_type.dart';
import '../../domain/repositories/task_repository.dart';
import '../data_source/task_data_source.dart';

class TaskRepositoryImpl extends TaskRepository {
  TaskRepositoryImpl(this._dataSource);

  final TaskDataSource _dataSource;

  @override
  Future<bool> addTask(Task task) {
    return _dataSource.addTask(task);
  }

  @override
  Future<bool> deleteTask(Task task) {
    return _dataSource.deleteTask(task);
  }

  @override
  Future<bool> deleteTaskById(String id) {
    return _dataSource.deleteTaskById(id);
  }

  @override
  Future<List<Task>?> getAllTask() {
    return _dataSource.getAllTask();
  }

  @override
  Future<bool> updateTask(Task task) {
    return _dataSource.updateTask(task);
  }

  @override
  Future<List<Task>?> getAllTaskByType(TaskType taskType) {
    return _dataSource.getAllTaskByType(taskType);
  }
}
