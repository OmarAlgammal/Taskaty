import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/services/local_services/hive_services.dart';
import 'package:taskaty/services/local_services/my_shared_preferences.dart';
import 'package:taskaty/view_model/theme_view_model/theme_view_model.dart';

import 'firebase_options.dart';
import 'models/task_model.dart';
import 'routing/routers.dart';
import 'routing/routes.dart';
import 'service_locator/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );
  await EasyLocalization.ensureInitialized();
  setup();
  Hive.registerAdapter(TaskModelAdapter());
  await locator<HiveServices<TaskModel>>().init();
  await locator<MySharedPreferences>().init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/localization',
      fallbackLocale: const Locale('ar'),
      child: ChangeNotifierProvider<ThemeViewModel>(
        create: (context) => ThemeViewModel(),
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
      theme: Provider.of<ThemeViewModel>(context).myTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: onGenerate,
      initialRoute: AppRoutes.homeScreen,
    );
  }
}
