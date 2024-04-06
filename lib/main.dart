import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:paymob_payment/paymob_payment.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/core/network/constants/payment_api_constants.dart';
import 'package:taskaty/repositories/local_service_repos/theme_repo.dart';

import 'package:taskaty/view_model/payment_view_model/firebase_payment_view_model.dart';
import 'package:taskaty/view_model/tasks_view_model/task_view_model.dart';
import 'package:taskaty/view_model/theme_view_model/theme_view_model.dart';

import 'firebase_options.dart';
import 'models/task_model/task_model.dart';
import 'routing/routers.dart';
import 'routing/routes.dart';
import 'service_locator/locator.dart';
import 'services/local/hive_services.dart';
import 'services/local/my_shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  Hive.registerAdapter(TaskModelAdapter());
  ThemeViewModel(locator<ThemeRepo>());
  await Future.wait([
    FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: 'recaptcha-v3-site-key',
      androidProvider: AndroidProvider.debug,
      appleProvider: AppleProvider.appAttest,
    ),
    EasyLocalization.ensureInitialized(),
    locator<HiveServices<TaskModel>>().init(),
    locator<MySharedPreferences>().init(),
    PaymobPayment.instance.initialize(
      apiKey: PaymentApiConstants.apiKey,
      integrationID: 4379027,
      iFrameID: 603861,
    ),
    locator<FirebasePaymentViewModel>().isUserStillOnSubscriptionPeriod(),
    locator<TaskViewModel>().syncDataFromLocalToRemote(),
  ]);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/localization',
      fallbackLocale: const Locale('ar'),
      child: ChangeNotifierProvider<ThemeViewModel>(
        create: (context) => ThemeViewModel(locator<ThemeRepo>()),
        child: const MyApp(),
        //child: const MyApp(),
      ),
    ),
  );
}

@override
void dispose() {
  locator<HiveServices<TaskModel>>().closeBox();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeViewModel>(context).getTheme(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: onGenerate,
      initialRoute: AppRoutes.landingScreen,
    );
  }
}
