import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'task_data_source.dart';

final dataSourceProvider = Provider((ref) {
  return TaskDataSourceAsDatabase();
});
