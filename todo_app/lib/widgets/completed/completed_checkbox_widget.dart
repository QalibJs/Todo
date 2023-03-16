import 'package:flutter/material.dart';

class CompletedCheckBoxTile extends StatelessWidget {
  final String tasks;
  const CompletedCheckBoxTile({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: (bool? value) {},
      value: true,
      subtitle: Text(
        tasks,
        style: const TextStyle(color: Colors.green, fontSize: 18),
      ),
    );
  }
}
