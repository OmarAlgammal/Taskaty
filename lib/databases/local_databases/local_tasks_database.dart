import 'package:hive/hive.dart';

import '../../models/task_model.dart';
import '../../services/local_services/hive_services.dart';

abstract class BaseLocalTasksDatabase<T> {
  Future<void> writeData(key, value);


  Box<T> getBox();

  Future<void> deleteData(String key);

  Future<int> clearData();
}

class LocalTasksDatabase implements BaseLocalTasksDatabase<TaskModel> {
  final BaseHiveService<TaskModel> _baseHiveService;

  LocalTasksDatabase(this._baseHiveService);

  @override
  Future<void> deleteData(String key) async {
    return _baseHiveService.deleteData(key);
  }

  @override
  Future<void> writeData(key, value) async {
    return await _baseHiveService.writeData(key, value);
  }

  @override
  Box<TaskModel> getBox() {
    return _baseHiveService.getBox();
  }

  @override
  Future<int> clearData() async{
    return await _baseHiveService.clearData();
  }


}
