import 'package:either_dart/either.dart';

import '../core/errors/error.dart';
import '../models/task_model/task_model.dart';

abstract class BaseTasksRepo {
  Future<Either<MyError, void>> setTask({required TaskModel task});

  Future<Either<MyError, void>> deleteTask({required String id});
}