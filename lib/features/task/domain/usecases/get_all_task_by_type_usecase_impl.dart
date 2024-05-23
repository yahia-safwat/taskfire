import '../models/task.dart';
import '../models/task_type.dart';
import '../repositories/task_repository.dart';
import 'get_all_task_by_type_usecase.dart';

class GetAllTaskByTypeUseCaseImpl extends GetAllTaskByTypeUseCase {
  GetAllTaskByTypeUseCaseImpl({required this.taskRepository});

  final TaskRepository taskRepository;

  @override
  Future<List<Task>?> execute(TaskType taskType) {
    return taskRepository.getAllTaskByType(taskType);
  }
}
