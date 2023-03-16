import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task/provider/task_provider.dart';

class CheckBoxListTileWidget extends StatelessWidget {
  final String task;
  final int index;
  final bool isChecked;

  const CheckBoxListTileWidget({
    Key? key,
    required this.task,
    required this.index,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: (value) {
        context.read<TaskProvider>().completedTask(index, task );
      },
      value: isChecked? true: false,
      title: Text(task),
    );
  }
}