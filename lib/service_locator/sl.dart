import 'package:get_it/get_it.dart';

import '../databases/auth_database.dart';
import '../databases/storage_database.dart';
import '../databases/local_databases/local_tasks_database.dart';
import '../databases/local_databases/local_utils_database.dart';
import '../databases/notion_database.dart';
import '../helpers/tasks_filtration.dart';
import '../models/task_model/task_model.dart';
import '../services/firebase_auth.dart';
import '../services/local_services/hive_services.dart';
import '../services/local_services/my_shared_preferences.dart';
import '../services/notion_services.dart';
import '../services/storage_services.dart';
import '../view_model/view_model.dart';

GetIt sl = GetIt.instance;

void setup() {
  sl.registerSingleton(TasksFiltration());

  sl.registerLazySingleton(() => StorageService());
  sl.registerSingleton(AuthServices());
  sl.registerSingleton((NotionService()));
  sl.registerSingleton(MySharedPreferences());
  sl.registerSingleton(HiveServices<TaskModel>('Tasks'));

  sl.registerSingleton(AuthDatabase(sl<AuthServices>()));
  sl.registerSingleton(NotionDataBase(sl<NotionService>()));
  sl.registerSingleton(
    LocalTasksDatabase(sl<HiveServices<TaskModel>>()),
  );
  sl.registerSingleton(LocalUtilsDatabase(sl<MySharedPreferences>()));
  sl.registerLazySingleton(() => StorageDatabase(sl<StorageService>()));

  sl.registerSingleton(ViewModel(sl<NotionDataBase>(), sl<LocalTasksDatabase>(),
      sl<StorageDatabase>(), sl<LocalUtilsDatabase>()));
}
