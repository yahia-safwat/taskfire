import '../models/task.dart';

abstract class DeleteTaskUseCase {
  Future<bool> execute(Task task);
}
