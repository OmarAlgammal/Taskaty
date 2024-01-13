import 'package:either_dart/either.dart';
import 'package:hive/hive.dart';
import 'package:taskaty/core/errors/error.dart';
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

  Either<Box<TaskModel>, Stream<List<TaskModel>>> getTasksSource() {
    if (_firebasePaymentViewModel.userOnSubscriptionPeriod) {
      return Right(_baseFirestoreTasksRepo.getTasksStream());
    }
    return Left(_baseLocalTasksRepo.getBox());
  }

  Future<Either<MyError, void>> setTask(TaskModel task) async {
    if (_firebasePaymentViewModel.userOnSubscriptionPeriod) {
      return _baseFirestoreTasksRepo.setTask(task: task);
    }
    return _baseLocalTasksRepo.setTask(task: task);
  }

  Future<Either<MyError, void>> deleteTask(String taskId) async {
    if (_firebasePaymentViewModel.userOnSubscriptionPeriod) {
      return _baseFirestoreTasksRepo.deleteTask(id: taskId);
    }

    return _baseLocalTasksRepo.deleteTask(id: taskId);
  }

  Future<Either<MyError, void>> syncData() async {
    /// TODO: Complete syncData()
    throw UnimplementedError();
  }
}
