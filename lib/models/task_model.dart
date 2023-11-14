import 'dart:core';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// TODO: Update this model to make some properties nullable

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends Equatable {
  @HiveField(0)
  late String _localId;
  @HiveField(1)
  late String _title;
  @HiveField(2)
  String? _note;
  @HiveField(3, defaultValue: false)
  bool _completed = false;
  @HiveField(4)
  DateTime? _completedDate;
  @HiveField(5)
  DateTime? _dueDate;
  @HiveField(6, defaultValue: false)
  bool _repeatDaily = false;
  @HiveField(7)
  DateTime? _modificationDate;
  @HiveField(8)
  final DateTime _creationDate;

  TaskModel(this._title, this._note, this._dueDate, this._repeatDaily,
      this._creationDate)
      : _localId = DateTime.now().toString(),
        _modificationDate = DateTime.now();

  TaskModel updateTask(
      {String? title,
      String? note,
      bool? completed,
      DateTime? dueDate,
      bool? repeatDaily}) {
    return TaskModel._updateModificationDate(
        title ?? _title,
        note ?? _note,
        dueDate ?? _dueDate,
        repeatDaily ?? _repeatDaily,
        completed ?? _completed,
        completed == null
            ? _completedDate
            : (completed ? DateTime.now() : null),
        _localId,
        _creationDate);
  }

  TaskModel._updateModificationDate(
    this._title,
    this._note,
    this._dueDate,
    this._repeatDaily,
    this._completed,
    this._completedDate,
    this._localId,
    this._creationDate,
  ) : _modificationDate = DateTime.now();

  // Today feature

  bool get isTodayTask =>
      thisSameDay(_dueDate) || _completed && _completedToday;

  // Weekly feature

  int getWeekNumberInMonth() {
    int daysInWeek = 7;
    int dayOfMonth = creationDate.day;

    int weekNumber = (dayOfMonth  / daysInWeek).ceil();

    return weekNumber;
  }

  // Monthly feature

  int get getMonthNumber => _creationDate.month;


  //

  bool get _completedToday => thisSameDay(_completedDate);

  bool thisSameDay(DateTime? date) {
    final now = DateTime.now();
    return date == null
        ? false
        : date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  bool thisSameYear() {
    return _creationDate.year == DateTime.now().year;
  }

  void _updateModificationDate() {
    _modificationDate = DateTime.now();
  }

  bool createdMonthIsBeforeThisMonth() => _creationDate.isBefore(DateTime.now());

  bool get repeatDaily => _repeatDaily;

  set repeatDaily(bool value) {
    _repeatDaily = value;
    _updateModificationDate();
  }

  DateTime? get dueDate => _dueDate;

  set dueDate(DateTime? value) {
    _dueDate = value;
    _updateModificationDate();
  }

  bool get completed => _completed;

  set completed(bool value) {
    _completed = value;
    _completedDate = DateTime.now();
    _updateModificationDate();
  }

  DateTime get creationDate => _creationDate;

  String? get note => _note;

  set note(String? value) {
    _note = value;
    _updateModificationDate();
  }

  String get title => _title;

  set title(String value) {
    _title = value;
    _updateModificationDate();
  }

  String get id => _localId;

  @override
  List<Object?> get props => [
        _localId,
        _title,
        _note,
        _completed,
        _completedDate,
        _dueDate,
        _repeatDaily,
        _modificationDate,
        _creationDate
      ];
}
