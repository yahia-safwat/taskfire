import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/task.dart';
import '../widgets/task_form.dart';

class TaskPage extends ConsumerStatefulWidget {
  const TaskPage({this.task, super.key});

  final Task? task;

  @override
  ConsumerState<TaskPage> createState() {
    return _TaskPage();
  }
}

class _TaskPage extends ConsumerState<TaskPage> {
  bool get _isTaskEditing => widget.task != null;

  @override
  Widget build(BuildContext context) {
    TaskFormWidget taskFormWidget = TaskFormWidget(task: widget.task);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _isTaskEditing ? 'Edit Task' : 'Add Task',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            taskFormWidget.saveTask();
          },
          child: Icon(_isTaskEditing ? Icons.edit : Icons.save),
        ),
        body: taskFormWidget);
  }
}
