// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel()
      ..localId = fields[0] as String
      ..remoteId = fields[1] as String?
      .._title = fields[2] as String?
      .._note = fields[3] as String?
      .._completed = fields[4] == null ? false : fields[4] as bool
      .._todayTask = fields[5] == null ? false : fields[5] as bool
      .._todayTaskDate = fields[6] as DateTime?
      .._repeatDaily = fields[7] == null ? false : fields[7] as bool
      .._files = fields[8] == null ? [] : (fields[8] as List).cast<String>()
      .._groupName = fields[9] as String?
      .._listName = fields[10] as String?
      .._modificationDate = fields[11] as DateTime?
      ..dateCreated = fields[12] as DateTime
      .._completedDate = fields[13] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.localId)
      ..writeByte(1)
      ..write(obj.remoteId)
      ..writeByte(2)
      ..write(obj._title)
      ..writeByte(3)
      ..write(obj._note)
      ..writeByte(4)
      ..write(obj._completed)
      ..writeByte(5)
      ..write(obj._todayTask)
      ..writeByte(6)
      ..write(obj._todayTaskDate)
      ..writeByte(7)
      ..write(obj._repeatDaily)
      ..writeByte(8)
      ..write(obj._files)
      ..writeByte(9)
      ..write(obj._groupName)
      ..writeByte(10)
      ..write(obj._listName)
      ..writeByte(11)
      ..write(obj._modificationDate)
      ..writeByte(12)
      ..write(obj.dateCreated)
      ..writeByte(13)
      ..write(obj._completedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel()
  ..localId = json['localId'] as String
  ..remoteId = json['remoteId'] as String?
  ..dateCreated = DateTime.parse(json['dateCreated'] as String)
  ..title = json['title'] as String?
  ..note = json['note'] as String?
  ..completed = json['completed'] as bool
  ..todayTask = json['todayTask'] as bool
  ..repeatDaily = json['repeatDaily'] as bool
  ..files = (json['files'] as List<dynamic>).map((e) => e as String).toList()
  ..groupName = json['groupName'] as String?
  ..listName = json['listName'] as String?;

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'localId': instance.localId,
      'remoteId': instance.remoteId,
      'dateCreated': instance.dateCreated.toIso8601String(),
      'title': instance.title,
      'note': instance.note,
      'completed': instance.completed,
      'todayTask': instance.todayTask,
      'repeatDaily': instance.repeatDaily,
      'files': instance.files,
      'groupName': instance.groupName,
      'listName': instance.listName,
    };
