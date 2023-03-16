import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController? controller;
  const InputWidget({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        textInputAction: TextInputAction.emergencyCall,
        controller: controller,
        decoration: const  InputDecoration(
        hintText: "Add Task To List",
        border: OutlineInputBorder()
        ),
      ),
    );
  }
}
