import '../../../../task/domain/models/task.dart';
import '../../../../task/presentation/providers/task_action/task_action_state.dart';

sealed class HomeUIState {}

class LoadingState extends HomeUIState {}

class NoTaskAvailableState extends HomeUIState {}

class TaskAvailableState extends HomeUIState {
  TaskAvailableState(this.taskList, {this.taskActionState});
  List<Task> taskList;
  TaskActionState? taskActionState;
}
