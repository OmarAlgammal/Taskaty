import 'package:get_it/get_it.dart';
import 'package:taskaty/databases/auth_database.dart';
import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/databases/local_databases/local_utils_database.dart';
import 'package:taskaty/databases/notion_database.dart';
import 'package:taskaty/databases/storage_database.dart';
import 'package:taskaty/helpers/tasks_utils.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/services/firebase_auth.dart';
import 'package:taskaty/services/local_services/hive_services.dart';
import 'package:taskaty/services/local_services/my_shared_preferences.dart';
import 'package:taskaty/services/notion_services.dart';
import 'package:taskaty/services/storage_services.dart';
import 'package:taskaty/view_model/use_cases/sync_tasks_use_case.dart';
import 'package:taskaty/view_model/view_model.dart';

GetIt sl = GetIt.instance;

void setup() {

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

  sl.registerSingleton(SyncTaskUseCase());
}
