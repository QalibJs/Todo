import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/task_provider.dart';
import 'package:task/widgets/completed/completed_checkbox_widget.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Completed")),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          return ListView.builder(
            itemCount: taskProvider.completedTaskList.length,
            itemBuilder: (context, index) {
              String tasks = taskProvider.completedTaskList[index];
              return CompletedCheckBoxTile(tasks: tasks);
            },
          );
        },
      ),
    );
  }
}
