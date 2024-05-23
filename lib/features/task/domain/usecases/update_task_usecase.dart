import '../models/task.dart';

abstract class UpdateTaskUseCase {
  Future<bool> execute(Task task);
}
