import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:taskaty/models/task_model/task_model.dart';
import 'package:taskaty/view_model/payment_view_model/firebase_payment_view_model.dart';

import '../../repositories/local_service_repos/local_tasks_repo.dart';
import '../../repositories/remote_service_repos/firebase_tasks_repo.dart';

class TaskViewModel {
  final BaseFirestoreTasksRepo _baseFirestoreTasksRepo;
  final BaseLocalTasksRepo _baseLocalTasksRepo;
  final FirebasePaymentViewModel _firebasePaymentViewModel;

  TaskViewModel(this._baseFirestoreTasksRepo, this._baseLocalTasksRepo,
      this._firebasePaymentViewModel);

  Stream<List<TaskModel>> getTasksSource() {
    if (_firebasePaymentViewModel.userOnSubscriptionPeriod) {
      return _baseFirestoreTasksRepo.getTasksStream();
    }
    return _baseLocalTasksRepo.getTasksStream();
  }

  Future<void> setTask(TaskModel task) async {
    Future.wait([
      if (_firebasePaymentViewModel.userOnSubscriptionPeriod)
        _baseFirestoreTasksRepo.setTask(task: task),
      _baseLocalTasksRepo.setTask(task: task),
    ]);
  }

  Future<void> deleteTask(String taskId) async {
    Future.wait([
      if (_firebasePaymentViewModel.userOnSubscriptionPeriod)
        _baseFirestoreTasksRepo.deleteTask(id: taskId),
      _baseLocalTasksRepo.deleteTask(id: taskId),
    ]);
  }

  Future<void> syncDataFromLocalToRemote() async {
    if (!_firebasePaymentViewModel.userOnSubscriptionPeriod) return;
    final tasks = _baseLocalTasksRepo
        .getBox()
        .values
        .where((element) => element.remoteId == null);
    await Future.wait(tasks.map((e) {
      return _baseFirestoreTasksRepo.setTask(task: e).thenRight((right) {
        e.updateTask(remoteId: DateTime.now().toString());
        return _baseLocalTasksRepo.setTask(task: e);
      });
    }));
  }
}
