import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/task_provider.dart';
import 'package:task/screens/completed_tas_screen.dart';
import 'package:task/widgets/check_box_tile.dart';
import 'package:task/widgets/elevated_button_widget.dart';
import 'package:task/widgets/floating_action_button_widget.dart';

import '../widgets/input_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task List"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CompletedTaskScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.send),
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder<Box>(
        valueListenable: Hive.box("todos").listenable(),
        builder: ((context, box, child) {
          List tasks = box.get("tasks") ?? [];

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              String task = tasks[index];
              return CheckBoxListTileWidget(
                task: task,
                index: index,
                isChecked: false,
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButtonWidget(
        onPressed: () {
          showBottomSheet(context);
        },
      ),
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Consumer<TaskProvider>(
          builder: (BuildContext context, taskProvider, Widget? child) {
            return SizedBox(
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputWidget(
                    controller: taskProvider.controller,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButtonWidget(
                    onPressed: () {
                      context.read<TaskProvider>().addTask(context);
                      context.read<TaskProvider>().clearData;
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
