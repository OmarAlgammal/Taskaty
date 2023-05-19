import 'package:hive/hive.dart';

import '../../models/task_model/task_model.dart';
import '../../services/local_services/hive_services.dart';

abstract class BaseLocalTasksDatabase {
  Future<void> writeData(String key, TaskModel value);

  List<TaskModel> getList({required bool Function(TaskModel element) query});

  Box<TaskModel> getBox();

  Future<void> deleteData(String key);
}

class LocalTasksDatabase implements BaseLocalTasksDatabase {
  final BaseHiveService<TaskModel> _baseHiveService;

  LocalTasksDatabase(this._baseHiveService);

  @override
  Future<void> deleteData(String key) async {
    return _baseHiveService.deleteData(key);
  }

  @override
  List<TaskModel> getList({required bool Function(TaskModel element) query}) {
    return _baseHiveService.getList(query: query);
  }

  @override
  Future<void> writeData(String key, TaskModel value) async {
    return await _baseHiveService.writeData(key, value);
  }

  @override
  Box<TaskModel> getBox() {
    return _baseHiveService.getBox();
  }
}
