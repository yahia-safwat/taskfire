import '../models/task.dart';
import '../repositories/task_repository.dart';
import 'add_task_usecase.dart';

class AddTaskUseCaseImpl extends AddTaskUseCase {
  AddTaskUseCaseImpl({required this.taskRepository});

  final TaskRepository taskRepository;

  @override
  Future<bool> execute(Task task) {
    return taskRepository.addTask(task);
  }
}
