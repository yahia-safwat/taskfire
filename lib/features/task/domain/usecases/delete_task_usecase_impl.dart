import '../models/task.dart';
import '../repositories/task_repository.dart';
import 'delete_task_usecase.dart';

class DeleteTaskUseCaseImpl extends DeleteTaskUseCase {
  DeleteTaskUseCaseImpl({required this.taskRepository});

  final TaskRepository taskRepository;

  @override
  Future<bool> execute(Task task) {
    return taskRepository.deleteTask(task);
  }
}
