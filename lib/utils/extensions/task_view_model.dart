import '../../service_locator/locator.dart';
import '../../view_model/tasks_view_model/task_view_model.dart';

extension TaskViewModelExtension on TaskViewModel {
  int get omar => 1;

  TaskViewModel instance() => locator<TaskViewModel>();
}
