import '../models/task.dart';
import '../models/task_type.dart';

abstract class GetAllTaskByTypeUseCase {
  Future<List<Task>?> execute(TaskType taskType);
}
