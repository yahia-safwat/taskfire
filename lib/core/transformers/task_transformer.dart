import '../../features/task/domain/models/task.dart';
import '../../features/task/domain/models/task_status.dart';
import '../../features/task/domain/models/task_type.dart';

List<Task> tansformToTaskList(List<Map<String, Object?>> data) {
  return data.map((t) {
    return Task(
      id: t['id'] as String,
      title: t['title'] as String,
      description: t['description'] as String,
      status: getTaskStatusByName(t['status'] as String),
      type: getTaskTypeByName(t['type'] as String),
    );
  }).toList();
}
