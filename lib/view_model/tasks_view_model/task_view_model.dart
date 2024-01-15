import 'package:either_dart/either.dart';
import 'package:hive/hive.dart';
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

  void syncDataFromLocalToRemote() async {
    final tasks = _baseLocalTasksRepo.getBox().values;
    await Future.wait(tasks.map((e) {
      return _baseFirestoreTasksRepo.setTask(task: e).thenRight((right) {
        return _baseLocalTasksRepo.deleteTask(id: e.id);
      });
    }));
  }

// void syncDataFromRemoteToLocal() async{
//   final tasksResult = await _baseFirestoreTasksRepo.getTasksList();
//   if (tasksResult.isRight){
//     Future.wait(tasksResult.right.map((e) {
//       return _baseLocalTasksRepo.setTask(task: e);
//     }));
//   }
// }
}
