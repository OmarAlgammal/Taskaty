import 'package:flutter/material.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/view_model/payment_view_model/firebase_payment_view_model.dart';
import 'package:taskaty/view_model/payment_view_model/payment_view_model.dart';
import 'package:taskaty/view_model/tasks_view_model/task_view_model.dart';

import '../../repositories/remote_service_repos/auth_repo.dart';
import '../../view_model/theme_view_model/theme_view_model.dart';

extension ScreenSize on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.height;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  TaskViewModel get taskViewModel => locator<TaskViewModel>();

  PaymentViewModel get paymentViewModel => locator<PaymentViewModel>();

  FirebasePaymentViewModel get firebasePaymentViewModel =>
      locator<FirebasePaymentViewModel>();

  //TasksRepo get tasksService => locator<TasksRepo>();

  //PaymentRepo get paymentRepo => locator<PaymentRepo>();

  //FirebasePaymentRepo get firebasePaymentRepo => locator<FirebasePaymentRepo>();

  AuthRepo get authRepo => locator<AuthRepo>();

  ThemeViewModel get themeViewModel => ThemeViewModel.instance(this);
}
