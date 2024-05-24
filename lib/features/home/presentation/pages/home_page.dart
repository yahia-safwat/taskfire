import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:taskfire/core/routes/app_routes.dart';

import '../../../task/domain/models/task.dart';
import '../../../task/presentation/providers/task_action/task_action_state.dart';
import '../providers/home_state/home_state_provider.dart';
import '../providers/home_state/home_ui_state.dart';
import '../widgets/task_filter.dart';
import '../widgets/task_item.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final HomeStateNotifier homeStateNotifier;
  final List<String> taskFilterItems = [
    'All',
    "Urgent Important",
    "Urgent Not Important",
    "Not Urgent Important",
    "Not Urgent Not Important"
  ];

  @override
  void initState() {
    homeStateNotifier = ref.read(homeState.notifier);
    super.initState();
  }

  void _showMessageIfRequired(TaskActionState? actionState) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      String msg = "";
      switch (actionState) {
        case TaskActionStateAdded():
          msg = "Task Added";
          break;
        case TaskActionStateUpdated():
          msg = "Task Updated";
          break;
        case TaskActionStateDeleted():
          msg = "Task Deleted";
          break;
        default:
          return;
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(homeUIStateProvider);
    Widget content;
    switch (uiState) {
      case LoadingState():
        return _getLoadingWidget();

      case NoTaskAvailableState():
        content = _getNoTaskWidget();
        break;

      default:
        {
          final taskAvailableState = uiState as TaskAvailableState;
          content = _getTaskListWidget(taskAvailableState.taskList);
          _showMessageIfRequired(taskAvailableState.taskActionState);
          break;
        }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to TaskFire',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRoutes.task);
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            height: 44,
            margin: const EdgeInsets.only(top: 8),
            child: TaskFilter(
              filterItems: taskFilterItems,
            ),
          ),
          const SizedBox(height: 16),
          content
        ],
      ),
    );
  }

  Widget _getLoadingWidget() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to TaskFire',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRoutes.task);
        },
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _getNoTaskWidget() {
    return const Expanded(
      child: SizedBox(
        height: double.infinity,
        child: Center(
          child: Text('You do not have any task.'),
        ),
      ),
    );
  }

  Widget _getTaskListWidget(List<Task> allTask) {
    return Expanded(
      child: ListView.builder(
        itemCount: allTask.length,
        itemBuilder: (ctx, index) => Dismissible(
          background: Container(
            color: Colors.red.withOpacity(0.5),
          ),
          onDismissed: (direction) {
            homeStateNotifier.deleteTask(allTask[index]);
          },
          key: ValueKey(allTask[index].id),
          child: InkWell(
            onTap: () {
              // Navigate to the edit task page
              context.pushNamed(AppRoutes.task, extra: allTask[index]);
            },
            child: TaskItem(
              allTask[index],
            ),
          ),
        ),
      ),
    );
  }
}
