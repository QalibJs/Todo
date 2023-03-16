import 'package:flutter/cupertino.dart';
import 'package:task/data/services/hive_service.dart';

class TaskProvider with ChangeNotifier {
  List taskList = [];
  final List completedTaskList = [];
  TextEditingController controller = TextEditingController();

  void addTask(context) {
    taskList.add(controller.text);
    TodoHiveService.instance.then((service) {
      service.saveData("task", taskList);
    });
    notifyListeners();
  }

  void get clearData => controller.clear();

  void completedTask(
    int index,
    String task,
  ) {
    completedTaskList.add(task);
    taskList.remove(task);

    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
