import '../models/task.dart';

abstract class GetAllTaskUseCase {
  Future<List<Task>?> execute();
}
