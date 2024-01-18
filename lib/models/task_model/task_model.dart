import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty/utils/extensions/date_time_extension.dart';

/// TODO: Update this model to make some properties nullable

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends Equatable {
  @HiveField(0)
  String _localId;
  @HiveField(1)
  String? remoteId;
  @HiveField(2)
  String _title;
  @HiveField(3)
  String? _note;
  @HiveField(4, defaultValue: false)
  bool _completed = false;
  @HiveField(5)
  DateTime? _completedDate;
  @HiveField(6)
  DateTime? _dueDate;
  @HiveField(7, defaultValue: false)
  bool _repeatDaily = false;
  @HiveField(8)
  DateTime _modificationDate;
  @HiveField(9)
  DateTime _creationDate;
  @HiveField(10)
  List<String>? _files;

  TaskModel(
    this._title,
    this._note,
    this._dueDate,
    this._repeatDaily,
  )   : _localId = DateTime.now().toString(),
        _modificationDate = DateTime.now(),
        _creationDate = DateTime.now();

  void updateTask(
      {
        String? remoteId,
        String? title,
      String? note,
      bool? completed,
      DateTime? dueDate,
      bool? repeatDaily,
      List<String>? files}) {
    this.remoteId = remoteId;
    _title = title ?? _title;
    _note = note ?? _note;
    _dueDate = dueDate ?? _dueDate;
    _repeatDaily = repeatDaily ?? _repeatDaily;
    _completed = completed ?? _completed;
    _completedDate = completed == null
        ? _completedDate
        : (completed ? DateTime.now() : null);
    _modificationDate = DateTime.now();
    _files = files ?? _files;
  }

  // Convert TaskModel to a JSON-encodable map
  Map<String, dynamic> toJson() {
    return {
      'id': _localId,
      'remoteId': remoteId ?? DateTime.now(),
      'title': _title,
      'note': _note,
      'completed': _completed,
      'completedDate': _completedDate?.toIso8601String(),
      'dueDate': _dueDate?.toIso8601String(),
      'repeatDaily': _repeatDaily,
      'modificationDate': _modificationDate.toIso8601String(),
      'creationDate': _creationDate.toIso8601String(),
      'files': _files,
    };
  }

  // Create a TaskModel instance from a JSON map
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      json['title'] as String,
      json['note'] as String?,
      json['dueDate'] != null
          ? DateTime.parse(json['dueDate'] as String)
          : null,
      json['repeatDaily'] as bool,
    )
      .._localId = json['id'] as String
      .._completed = json['completed'] as bool
      .._completedDate = json['completedDate'] != null
          ? DateTime.parse(json['completedDate'] as String)
          : null
      .._modificationDate = DateTime.parse(json['modificationDate'] as String)
      .._creationDate = DateTime.parse(json['creationDate'] as String)
      .._files = (json['files'] as List<dynamic>?)?.cast<String>();
  }

  bool get isTodayTask =>
      _dueDate!.likeToday || _completed && _completedDate!.likeToday;

  @override
  List<Object?> get props => [
        _localId,
        remoteId,
        _title,
        _note,
        _completed,
        _completedDate,
        _dueDate,
        _repeatDaily,
        _modificationDate,
        _creationDate
      ];

  String get localId => _localId;

  DateTime get modificationDate => _modificationDate;

  DateTime get creationDate => _creationDate;

  List<String>? get files => _files;

  bool get repeatDaily => _repeatDaily;

  DateTime? get dueDate => _dueDate;

  DateTime? get completedDate => _completedDate;

  bool get completed => _completed;

  String? get note => _note;

  String get title => _title;
}
