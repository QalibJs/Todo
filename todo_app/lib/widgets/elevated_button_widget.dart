import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  const ElevatedButtonWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
      ),
      onPressed: () => onPressed(),
      child:const SizedBox(
        child:  Text(
          "Add task to list",
        ),
      ),
    );
  }
}
