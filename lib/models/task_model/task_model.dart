import 'dart:core';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';

part 'task_model.g.dart';

/// TODO: Update this model to make some properties nullable

@JsonSerializable()
@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  late String localId;
  @HiveField(1)
  String? remoteId;
  @HiveField(2)
  String? _title;
  @HiveField(3)
  String? _note;
  @HiveField(4, defaultValue: false)
  bool _completed = false;
  @HiveField(5, defaultValue: false)
  bool _todayTask = false;
  @HiveField(6)
  DateTime? _todayTaskDate;
  @HiveField(7, defaultValue: false)
  bool _repeatDaily = false;
  @HiveField(8, defaultValue: [])
  List<String> _files = [];
  @HiveField(9)
  String? _groupName;
  @HiveField(10)
  String? _listName;
  @HiveField(11)
  DateTime? _modificationDate;
  @HiveField(12)
  late DateTime dateCreated;
  @HiveField(13)
  DateTime? _completedDate;

  TaskModel() {
    localId = DateTime.now().toString();
    dateCreated = DateTime.now();
  }


  factory TaskModel.fromJson(Map<String, Object?> map) =>
      _$TaskModelFromJson(map);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  bool isModificationDateAfterDate({required DateTime date}){
    return _modificationDate != null ? _modificationDate!.isAfter(date) : false;
  }

  bool isIndependentTask() {
    return listName == null && groupName == null;
  }


  bool isTodayTask() {
    if (_todayTaskDate == null) return false;
    return todayTask && _todayTaskDate!.atThisDay() ||
        repeatDaily;
  }

  bool isTaskInList(){
    return title != null && listName != null;
  }

  bool inIndbendentList({TaskModel? task}) {
    if (task == null){
      return title != null && listName != null && groupName == null;
    }
    return title != null && listName == task.listName && task.listName != null && groupName == null && task.groupName == null;
  }

  bool isList(){
    return listName != null;
  }

  bool isIndependentList(){
    return title == null && listName != null && groupName == null;
  }

  bool isListInGroup() {
    return listName != null && groupName != null;
  }

  bool isInGroup(String? groupName) {
    return this.groupName == groupName && this.groupName != null;
  }

  bool isGroup() {
    return listName == null && groupName != null;
  }


  bool modificationDateAfterDate({required DateTime date}) {
    return _modificationDate != null ? _modificationDate!.isAfter(date) : false;
  }

  

  void changeModificationDate() {
    _modificationDate = DateTime.now();
  }

  String? get title => _title;

  set title(String? value) {
    _title = value;
    changeModificationDate();
  }

  String? get note => _note;

  set note(String? value) {
    _note = value;
    changeModificationDate();
  }


  set completed(bool value) {
    _completed = value;
    _completedDate = DateTime.now();
    changeModificationDate();
  }

  bool get completed => _completed;

  bool isCompleted(){
    if (_completedDate == null) return false;
    return _completed && _completedDate!.atThisDay();
  }

  bool get todayTask => _todayTask;

  set todayTask(bool value) {
    _todayTask = value;
    _todayTaskDate = DateTime.now();
    changeModificationDate();
  }

  bool get repeatDaily => _repeatDaily;

  set repeatDaily(bool value) {
    _repeatDaily = value;
    changeModificationDate();
  }

  List<String> get files => _files;

  set files(List<String> value) {
    _files = value;
    changeModificationDate();
  }

  String? get groupName => _groupName;

  set groupName(String? value) {
    _groupName = value;
    changeModificationDate();
  }

  String? get listName => _listName;

  set listName(String? value) {
    _listName = value;
    changeModificationDate();
  }

  DateTime? get dateCompleted => _completedDate;
}
