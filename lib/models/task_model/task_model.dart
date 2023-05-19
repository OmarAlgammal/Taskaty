import 'package:hive_flutter/hive_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/mappers/data_source_mappers.dart';
import '../../core/network/api_constance.dart';

part 'task_model.freezed.dart';

part 'task_model.g.dart';

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
}
