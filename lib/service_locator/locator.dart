import 'package:get_it/get_it.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/repositories/remote_service_repos/firebase_payment_repo.dart';
import 'package:taskaty/repositories/remote_service_repos/firebase_tasks_repo.dart';
import 'package:taskaty/repositories/remote_service_repos/payment_repo.dart';
import 'package:taskaty/services/api/api_service.dart';
import 'package:taskaty/services/firebase/firebase_auth.dart';
import 'package:taskaty/view_model/internet_connection.dart';
import 'package:taskaty/view_model/payment_view_model/firebase_payment_view_model.dart';
import 'package:taskaty/view_model/payment_view_model/payment_view_model.dart';

import '../repositories/local_service_repos/local_tasks_repo.dart';
import '../repositories/local_service_repos/settings_repo.dart';
import '../repositories/remote_service_repos/auth_repo.dart';
import '../services/firebase/firestore_sevrvice.dart';
import '../services/local/hive_services.dart';
import '../services/local/my_shared_preferences.dart';
import '../view_model/tasks_view_model/task_view_model.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerSingleton(ApiService());

  locator.registerSingleton(FireStoreService());
  locator.registerSingleton(AuthServices());
  locator.registerSingleton(MySharedPreferences());
  locator.registerSingleton(HiveServices<TaskModel>('Tasks'));

  locator.registerSingleton(AuthRepo(locator<AuthServices>()));
  locator.registerSingleton(PaymentRepo(locator<ApiService>()));
  locator.registerSingleton(
      FirebasePaymentRepo(locator<FireStoreService>(), locator<AuthRepo>()));
  locator.registerSingleton(
    LocalTasksRepo(locator<HiveServices<TaskModel>>()),
  );
  locator.registerSingleton(ThemeSettingRepo(locator<MySharedPreferences>()));
  locator.registerSingleton(LanguageSettingRepo(locator<MySharedPreferences>()));
  locator.registerSingleton(
      FirestoreTasksRepo(locator<FireStoreService>(), locator<AuthServices>()));

  locator.registerSingleton(
      FirebasePaymentViewModel(locator<FirebasePaymentRepo>()));

  locator.registerSingleton(InternetConnection());

  locator.registerLazySingleton(()=> PaymentViewModel(locator<PaymentRepo>()));
  locator.registerLazySingleton(() => TaskViewModel(
        locator<FirestoreTasksRepo>(),
        locator<LocalTasksRepo>(),
        locator<FirebasePaymentViewModel>(),
      ));
}
