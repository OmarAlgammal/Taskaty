import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';

/// TODO: Update this model to make some properties nullable

part 'task_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class TaskModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  late String title;
  @HiveField(2)
  String? note;
  @HiveField(3, defaultValue: false)
  bool completed = false;
  @HiveField(4)
  DateTime? completedDate;
  @HiveField(5)
  DateTime? dueDate;
  @HiveField(6, defaultValue: false)
  bool repeatDaily = false;
  @HiveField(7)
  DateTime? modificationDate;
  @HiveField(8)
  final DateTime creationDate;
  @HiveField(9)
  List<String>? files;

  TaskModel(
    this.title,
    this.note,
    this.dueDate,
    this.repeatDaily,
  )   : id = DateTime.now().toString(),
        modificationDate = DateTime.now(),
        creationDate = DateTime.now();

  void updateTask(
      {String? title,
      String? note,
      bool? completed,
      DateTime? dueDate,
      bool? repeatDaily,
      List<String>? files}) {
    this.title = title ?? this.title;
    this.note = note ?? this.note;
    this.dueDate = dueDate ?? this.dueDate;
    this.repeatDaily = repeatDaily ?? this.repeatDaily;
    this.completed = completed ?? this.completed;
    completedDate = completed == null
        ? completedDate
        : (completed ? DateTime.now() : null);
    modificationDate = DateTime.now();
    this.files = files ?? this.files;
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  bool get isTodayTask =>
      dueDate!.likeToday || completed && completedDate!.likeToday;

  @override
  List<Object?> get props => [
        id,
        title,
        note,
        completed,
        completedDate,
        dueDate,
        repeatDaily,
        modificationDate,
        creationDate
      ];
}
