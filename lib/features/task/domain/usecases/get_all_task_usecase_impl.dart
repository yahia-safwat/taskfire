import '../models/task.dart';
import '../repositories/task_repository.dart';
import 'get_all_task_usecase.dart';

class GetAllTaskUseCaseImpl extends GetAllTaskUseCase {
  GetAllTaskUseCaseImpl({required this.taskRepository});

  final TaskRepository taskRepository;

  @override
  Future<List<Task>?> execute() {
    return taskRepository.getAllTask();
  }
}
