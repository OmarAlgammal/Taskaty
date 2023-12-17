import 'package:flutter/material.dart';
import 'package:taskaty/repositories/remote_service_repos/auth_repo.dart';
import 'package:taskaty/repositories/remote_service_repos/payment_repo.dart';
import 'package:taskaty/repositories/remote_service_repos/tasks_repo.dart';
import 'package:taskaty/service_locator/locator.dart';
import 'package:taskaty/view_model/tasks_view_model/use_cases/task_view_model.dart';

extension ScreenSize on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.height;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  TaskViewModel get taskViewModel => locator<TaskViewModel>();

  TasksRepo get tasksService => locator<TasksRepo>();

  PaymentRepo get paymentRepo => locator<PaymentRepo>();

  AuthRepo get authRepo => locator<AuthRepo>();
}
