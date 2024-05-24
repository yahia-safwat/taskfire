import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/task/domain/models/task_type.dart';

final taskTypesProvider = Provider((ref) {
  return TaskType.values.toList();
});
