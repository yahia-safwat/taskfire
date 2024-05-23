import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data_source/datasource_provider.dart';
import 'taskrepository_impl.dart';

final taskRepositoryProvider = Provider((ref) {
  final dataSource = ref.read(dataSourceProvider);
  return TaskRepositoryImpl(dataSource);
});
