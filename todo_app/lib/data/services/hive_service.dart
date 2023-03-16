import 'package:hive_flutter/adapters.dart';

class TodoHiveService {
  TodoHiveService._();

  static TodoHiveService? _instance;
  static Box? _box;

  static Future<TodoHiveService> get instance async {
    _instance ??= TodoHiveService._();
    _box = await Hive.openBox("todos");
    return _instance!;
  }

  void saveData(String key, dynamic value) => _box!.put(key, value);
  void saveListdata(dynamic values) => _box!.addAll(values);
  void removeData(String key) => _box!.delete(key);
  Future<List> getListDatas(dynamic key) async {
    List datas = _box!.get(key);
    return datas;
  }
}
