import '../models/task.dart';
import '../repositories/task_repository.dart';
import 'update_task_usecase.dart';

class UpdateTaskUseCaseImpl extends UpdateTaskUseCase {
  UpdateTaskUseCaseImpl({required this.taskRepository});

  final TaskRepository taskRepository;

  @override
  Future<bool> execute(Task task) {
    return taskRepository.updateTask(task);
  }
}
