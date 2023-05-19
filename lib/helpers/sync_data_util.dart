import '../../models/task_model/task_model.dart';

class SyncDataUtil {
  /// Local list is empty & remote list is empty
  ///   >> Upload, delete and update normally
  /// Local list is empty & remote list IS NOT empty
  ///   >> Add all remote list to local list
  /// Local list IS NOT empty & remote list is empty
  ///   >>  Upload all tasks in local to remote
  /// Local list IS NOT empty & remote list IS NOT empty
  ///   >> Modify tasks depend on last modification list else files (add list of files from remote to local and remove similarities

  // Tasks doesn't has remote id
  List<TaskModel> localTasks;

  // Tasks after last modification date
  List<TaskModel> remoteTasks;
  DateTime? lastModificationDate;

  static SyncDataUtil? instance;

  SyncDataUtil(
      {this.localTasks = const [],
      this.remoteTasks = const [],
      required this.lastModificationDate});

  void copyWith(
      {List<TaskModel>? localTasks,
      List<TaskModel>? remoteTasks,
      required DateTime lastModificationDate}) {
    this.localTasks = localTasks ?? this.localTasks;
    this.remoteTasks = remoteTasks ?? this.remoteTasks;
    this.lastModificationDate = lastModificationDate;
  }

  void syncData() {
    List<TaskModel> tasksToUpload = [];

    /// Local list is empty & remote list is empty
    ///   >> Upload, delete and update normally
    if (lastModificationDate != null) {
      localTasks = remoteTasks;
    }

    /// Local list is empty & remote list IS NOT empty
    ///   >> Add all remote list to local list
    if (localTasks.isEmpty && remoteTasks.isNotEmpty) {
      localTasks = remoteTasks;
    }

    /// Local list IS NOT empty & remote list is empty
    ///   >>  Upload all tasks in local to remote
    if (localTasks.isNotEmpty && remoteTasks.isEmpty) {
      remoteTasks = localTasks;

      /// TODO: Upload tasks to remote datebase
    }

    /// Local list IS NOT empty & remote list IS NOT empty
    ///   >> Modify tasks depend on last modification list else files (add list of files from remote to local and remove similarities
    ///
    if (localTasks.isNotEmpty && remoteTasks.isNotEmpty) {}
  }

  List<TaskModel> addFromRemoteToLocal() {
    List<TaskModel> tasks = [];
    for (final task in remoteTasks) {
      final taskIsNotExist = localTasks
          .where((localTask) => localTask.remoteId == task.remoteId)
          .toList()
          .isEmpty;
      if (taskIsNotExist) tasks.add(task);
    }
    return tasks;
  }

  List<TaskModel> updateLocalFromRemote() {
    List<TaskModel> updatedLocalTasks = [];
    for (TaskModel localTask in localTasks) {
      updatedLocalTasks = remoteTasks.where((remoteTask) {
        if (remoteTask.localId == localTask.localId) {
          final List<String> files = [...remoteTask.files, ...localTask.files];
          if (remoteTask.modificationDate!.isAfter(localTask.modificationDate!)) {
            localTask = remoteTask;
            localTask = localTask.copyWith(files: files);
          } else {
            remoteTask = localTask;
            remoteTask = remoteTask.copyWith(files: files);
          }
          return true;
        }
        return false;
      }).toList();
    }
    return updatedLocalTasks;
  }

  List<TaskModel> updateRemoteFromLocal() {
    List<TaskModel> remoteTasksToUpdate = [];
    for (TaskModel localTask in localTasks) {
      remoteTasksToUpdate = remoteTasks.where((remoteTask) {
        if (remoteTask.localId == localTask.localId) {
          final List<String> files = [...remoteTask.files, ...localTask.files];
          if (remoteTask.modificationDate!
              .isBefore(localTask.modificationDate!)) {
            remoteTask = localTask;
            remoteTask = remoteTask.copyWith(files: files);
          } else {
            localTask = remoteTask;
            localTask = localTask.copyWith(files: files);
          }
          return true;
        }
        return false;
      }).toList();
    }
    return remoteTasksToUpdate;
  }

  List<TaskModel> uploadTasksFromLocalToRemote() {
    return localTasks.where((localTask) => localTask.remoteId == null).toList();
  }
}
