import 'package:hive_flutter/hive_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskaty/core/mappers/data_source_mappers.dart';
import 'package:taskaty/core/network/api_constance.dart';
import 'package:taskaty/helpers/date_time_util.dart';
import 'package:taskaty/models/group_lists_model.dart';
import 'package:taskaty/models/task_model/task_model.dart';


part 'task_model.freezed.dart';

part 'task_model.g.dart';

/// TODO: Update this model to make some properties nullable

@Freezed()
@HiveType(typeId: 0)
class TaskModel with _$TaskModel {
  factory TaskModel({
    @HiveField(0) required String localId,
    @HiveField(1) String? remoteId,
    @HiveField(2) String? title,
    @HiveField(3) String? note,
    @HiveField(4, defaultValue: false) @Default(false) bool completed,
    @HiveField(5, defaultValue: false) @Default(false) bool addedToMyDay,
    @HiveField(6, defaultValue: false) @Default(false) bool repeatDaily,
    @HiveField(7, defaultValue: []) @Default([]) List<String> files,
    @HiveField(8) String? groupName,
    @HiveField(9) String? listName,
    @HiveField(10) required DateTime modificationDate,
    @HiveField(11) required DateTime dateCreated,
    @HiveField(12) DateTime? dateCompleted,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, Object?> map) =>
      _$TaskModelFromJson(map);


  bool isInMyTasks(){
    return listName == null && groupName == null;
  }

  bool isCompleted() {
    return completed;
  }

  bool isAddedToMyDay() {
    return addedToMyDay && DateTimeUtil.sameDay(modificationDate) ||
        repeatDaily;
  }

  bool isInList(String? listName) {
    return this.listName == listName && listName != null && groupName == null;
  }

  bool representAListInGroup(){
    return listName != null && groupName != null;
  }

  bool isInGroup(String? groupName) {
    return this.groupName == groupName && this.groupName != null;
  }

  bool representAGroup(){
    return listName == null && groupName != null;
  }
}
