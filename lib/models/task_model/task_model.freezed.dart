// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  @HiveField(0)
  String get localId => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get remoteId => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get note => throw _privateConstructorUsedError;
  @HiveField(4, defaultValue: false)
  bool get completed => throw _privateConstructorUsedError;
  @HiveField(5, defaultValue: false)
  bool get addedToMyDay => throw _privateConstructorUsedError;
  @HiveField(6, defaultValue: false)
  bool get repeatDaily => throw _privateConstructorUsedError;
  @HiveField(7, defaultValue: [])
  List<String> get files => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get groupName => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get listName => throw _privateConstructorUsedError;
  @HiveField(10)
  DateTime get modificationDate => throw _privateConstructorUsedError;
  @HiveField(11)
  DateTime get dateCreated => throw _privateConstructorUsedError;
  @HiveField(12)
  DateTime? get dateCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {@HiveField(0) String localId,
      @HiveField(1) String? remoteId,
      @HiveField(2) String? title,
      @HiveField(3) String? note,
      @HiveField(4, defaultValue: false) bool completed,
      @HiveField(5, defaultValue: false) bool addedToMyDay,
      @HiveField(6, defaultValue: false) bool repeatDaily,
      @HiveField(7, defaultValue: []) List<String> files,
      @HiveField(8) String? groupName,
      @HiveField(9) String? listName,
      @HiveField(10) DateTime modificationDate,
      @HiveField(11) DateTime dateCreated,
      @HiveField(12) DateTime? dateCompleted});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? remoteId = freezed,
    Object? title = freezed,
    Object? note = freezed,
    Object? completed = null,
    Object? addedToMyDay = null,
    Object? repeatDaily = null,
    Object? files = null,
    Object? groupName = freezed,
    Object? listName = freezed,
    Object? modificationDate = null,
    Object? dateCreated = null,
    Object? dateCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String,
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      addedToMyDay: null == addedToMyDay
          ? _value.addedToMyDay
          : addedToMyDay // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatDaily: null == repeatDaily
          ? _value.repeatDaily
          : repeatDaily // ignore: cast_nullable_to_non_nullable
              as bool,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      listName: freezed == listName
          ? _value.listName
          : listName // ignore: cast_nullable_to_non_nullable
              as String?,
      modificationDate: null == modificationDate
          ? _value.modificationDate
          : modificationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateCompleted: freezed == dateCompleted
          ? _value.dateCompleted
          : dateCompleted // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskModelCopyWith<$Res> implements $TaskModelCopyWith<$Res> {
  factory _$$_TaskModelCopyWith(
          _$_TaskModel value, $Res Function(_$_TaskModel) then) =
      __$$_TaskModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String localId,
      @HiveField(1) String? remoteId,
      @HiveField(2) String? title,
      @HiveField(3) String? note,
      @HiveField(4, defaultValue: false) bool completed,
      @HiveField(5, defaultValue: false) bool addedToMyDay,
      @HiveField(6, defaultValue: false) bool repeatDaily,
      @HiveField(7, defaultValue: []) List<String> files,
      @HiveField(8) String? groupName,
      @HiveField(9) String? listName,
      @HiveField(10) DateTime modificationDate,
      @HiveField(11) DateTime dateCreated,
      @HiveField(12) DateTime? dateCompleted});
}

/// @nodoc
class __$$_TaskModelCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$_TaskModel>
    implements _$$_TaskModelCopyWith<$Res> {
  __$$_TaskModelCopyWithImpl(
      _$_TaskModel _value, $Res Function(_$_TaskModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? remoteId = freezed,
    Object? title = freezed,
    Object? note = freezed,
    Object? completed = null,
    Object? addedToMyDay = null,
    Object? repeatDaily = null,
    Object? files = null,
    Object? groupName = freezed,
    Object? listName = freezed,
    Object? modificationDate = null,
    Object? dateCreated = null,
    Object? dateCompleted = freezed,
  }) {
    return _then(_$_TaskModel(
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String,
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      addedToMyDay: null == addedToMyDay
          ? _value.addedToMyDay
          : addedToMyDay // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatDaily: null == repeatDaily
          ? _value.repeatDaily
          : repeatDaily // ignore: cast_nullable_to_non_nullable
              as bool,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      listName: freezed == listName
          ? _value.listName
          : listName // ignore: cast_nullable_to_non_nullable
              as String?,
      modificationDate: null == modificationDate
          ? _value.modificationDate
          : modificationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateCompleted: freezed == dateCompleted
          ? _value.dateCompleted
          : dateCompleted // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskModel implements _TaskModel {
  _$_TaskModel(
      {@HiveField(0) required this.localId,
      @HiveField(1) this.remoteId,
      @HiveField(2) this.title,
      @HiveField(3) this.note,
      @HiveField(4, defaultValue: false) this.completed = false,
      @HiveField(5, defaultValue: false) this.addedToMyDay = false,
      @HiveField(6, defaultValue: false) this.repeatDaily = false,
      @HiveField(7, defaultValue: []) final List<String> files = const [],
      @HiveField(8) this.groupName,
      @HiveField(9) this.listName,
      @HiveField(10) required this.modificationDate,
      @HiveField(11) required this.dateCreated,
      @HiveField(12) this.dateCompleted})
      : _files = files;

  factory _$_TaskModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaskModelFromJson(json);

  @override
  @HiveField(0)
  final String localId;
  @override
  @HiveField(1)
  final String? remoteId;
  @override
  @HiveField(2)
  final String? title;
  @override
  @HiveField(3)
  final String? note;
  @override
  @JsonKey()
  @HiveField(4, defaultValue: false)
  final bool completed;
  @override
  @JsonKey()
  @HiveField(5, defaultValue: false)
  final bool addedToMyDay;
  @override
  @JsonKey()
  @HiveField(6, defaultValue: false)
  final bool repeatDaily;
  final List<String> _files;
  @override
  @JsonKey()
  @HiveField(7, defaultValue: [])
  List<String> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  @HiveField(8)
  final String? groupName;
  @override
  @HiveField(9)
  final String? listName;
  @override
  @HiveField(10)
  final DateTime modificationDate;
  @override
  @HiveField(11)
  final DateTime dateCreated;
  @override
  @HiveField(12)
  final DateTime? dateCompleted;

  @override
  String toString() {
    return 'TaskModel(localId: $localId, remoteId: $remoteId, title: $title, note: $note, completed: $completed, addedToMyDay: $addedToMyDay, repeatDaily: $repeatDaily, files: $files, groupName: $groupName, listName: $listName, modificationDate: $modificationDate, dateCreated: $dateCreated, dateCompleted: $dateCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskModel &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.addedToMyDay, addedToMyDay) ||
                other.addedToMyDay == addedToMyDay) &&
            (identical(other.repeatDaily, repeatDaily) ||
                other.repeatDaily == repeatDaily) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.listName, listName) ||
                other.listName == listName) &&
            (identical(other.modificationDate, modificationDate) ||
                other.modificationDate == modificationDate) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.dateCompleted, dateCompleted) ||
                other.dateCompleted == dateCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      localId,
      remoteId,
      title,
      note,
      completed,
      addedToMyDay,
      repeatDaily,
      const DeepCollectionEquality().hash(_files),
      groupName,
      listName,
      modificationDate,
      dateCreated,
      dateCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskModelCopyWith<_$_TaskModel> get copyWith =>
      __$$_TaskModelCopyWithImpl<_$_TaskModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskModelToJson(
      this,
    );
  }
}

abstract class _TaskModel implements TaskModel {
  factory _TaskModel(
      {@HiveField(0) required final String localId,
      @HiveField(1) final String? remoteId,
      @HiveField(2) final String? title,
      @HiveField(3) final String? note,
      @HiveField(4, defaultValue: false) final bool completed,
      @HiveField(5, defaultValue: false) final bool addedToMyDay,
      @HiveField(6, defaultValue: false) final bool repeatDaily,
      @HiveField(7, defaultValue: []) final List<String> files,
      @HiveField(8) final String? groupName,
      @HiveField(9) final String? listName,
      @HiveField(10) required final DateTime modificationDate,
      @HiveField(11) required final DateTime dateCreated,
      @HiveField(12) final DateTime? dateCompleted}) = _$_TaskModel;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$_TaskModel.fromJson;

  @override
  @HiveField(0)
  String get localId;
  @override
  @HiveField(1)
  String? get remoteId;
  @override
  @HiveField(2)
  String? get title;
  @override
  @HiveField(3)
  String? get note;
  @override
  @HiveField(4, defaultValue: false)
  bool get completed;
  @override
  @HiveField(5, defaultValue: false)
  bool get addedToMyDay;
  @override
  @HiveField(6, defaultValue: false)
  bool get repeatDaily;
  @override
  @HiveField(7, defaultValue: [])
  List<String> get files;
  @override
  @HiveField(8)
  String? get groupName;
  @override
  @HiveField(9)
  String? get listName;
  @override
  @HiveField(10)
  DateTime get modificationDate;
  @override
  @HiveField(11)
  DateTime get dateCreated;
  @override
  @HiveField(12)
  DateTime? get dateCompleted;
  @override
  @JsonKey(ignore: true)
  _$$_TaskModelCopyWith<_$_TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}
