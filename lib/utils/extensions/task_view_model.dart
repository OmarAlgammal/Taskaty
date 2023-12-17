
import 'package:taskaty/view_model/tasks_view_model/use_cases/task_view_model.dart';

import '../../service_locator/locator.dart';

extension TaskViewModelExtension on TaskViewModel{

  int get omar => 1;
  TaskViewModel instance () => locator<TaskViewModel>();
}