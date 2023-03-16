import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  const FloatingActionButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onPressed(),
      child: const Icon(Icons.add),
    );
  }
}
