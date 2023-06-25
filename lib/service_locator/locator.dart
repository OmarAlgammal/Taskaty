import 'package:get_it/get_it.dart';
import 'package:taskaty/databases/auth_database.dart';
import 'package:taskaty/databases/firestore_database.dart';
import 'package:taskaty/databases/local_databases/local_tasks_database.dart';
import 'package:taskaty/databases/local_databases/local_utils_database.dart';
import 'package:taskaty/databases/notion_database.dart';
import 'package:taskaty/databases/payment_database.dart';
import 'package:taskaty/databases/storage_database.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/services/firebase_auth.dart';
import 'package:taskaty/services/firestore_service.dart';
import 'package:taskaty/services/internet_connection.dart';
import 'package:taskaty/services/local_services/hive_services.dart';
import 'package:taskaty/services/local_services/my_shared_preferences.dart';
import 'package:taskaty/services/notion_services.dart';
import 'package:taskaty/services/payment_services.dart';
import 'package:taskaty/services/storage_services.dart';
import 'package:taskaty/view_model/payment_view_model/payment_cubit.dart';
import 'package:taskaty/view_model/tasks_view_model/tasks_view_model.dart';
import 'package:taskaty/view_model/tasks_view_model/use_cases/upload_files_to_storage_use_case.dart';
import '../view_model/tasks_view_model/use_cases/sync_tasks_use_case.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => PaymentService());
  locator.registerSingleton(FireStoreService());
  locator.registerLazySingleton(() => StorageService());
  locator.registerSingleton(AuthServices());
  locator.registerSingleton((NotionService()));
  locator.registerSingleton(MySharedPreferences());
  locator.registerSingleton(HiveServices<TaskModel>('Tasks'));

  locator.registerLazySingleton(() => PaymentDatabase(locator<PaymentService>()));
  locator.registerSingleton(FireStoreDatabase(locator<FireStoreService>()));
  locator.registerSingleton(AuthDatabase(locator<AuthServices>()));
  locator.registerSingleton(NotionDataBase(locator<NotionService>()));
  locator.registerSingleton(
    LocalTasksDatabase(locator<HiveServices<TaskModel>>()),
  );
  locator.registerSingleton(LocalUtilsDatabase(locator<MySharedPreferences>()));
  locator.registerLazySingleton(() => StorageDatabase(locator<StorageService>()));


  locator.registerSingleton(InternetConnection());
  locator.registerLazySingleton(
      () => UploadFilesToStorageUseCase(locator<StorageDatabase>()));
  locator.registerLazySingleton(() => PaymentViewModel(locator<PaymentDatabase>()));
  locator.registerSingleton(
    ViewModel(
      locator<NotionDataBase>(),
      locator<LocalTasksDatabase>(),
      locator<StorageDatabase>(),
      locator<LocalUtilsDatabase>(),
      locator<UploadFilesToStorageUseCase>(),
    ),
  );
  locator.registerSingleton(
    SyncTaskUseCase(
      locator<LocalUtilsDatabase>(),
      locator<LocalTasksDatabase>(),
      locator<NotionDataBase>(),
      locator<FireStoreDatabase>(),
      locator<AuthDatabase>(),
    ),
  );
}
