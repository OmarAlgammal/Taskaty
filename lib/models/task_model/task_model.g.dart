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
    return TaskModel(
      localId: fields[0] as String,
      remoteId: fields[1] as String?,
      title: fields[2] as String?,
      note: fields[3] as String?,
      completed: fields[4] == null ? false : fields[4] as bool,
      addedToMyDay: fields[5] == null ? false : fields[5] as bool,
      repeatDaily: fields[6] == null ? false : fields[6] as bool,
      files: fields[7] == null ? [] : (fields[7] as List).cast<String>(),
      groupName: fields[8] as String?,
      listName: fields[9] as String?,
      modificationDate: fields[10] as DateTime,
      dateCreated: fields[11] as DateTime,
      dateCompleted: fields[12] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.localId)
      ..writeByte(1)
      ..write(obj.remoteId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.note)
      ..writeByte(4)
      ..write(obj.completed)
      ..writeByte(5)
      ..write(obj.addedToMyDay)
      ..writeByte(6)
      ..write(obj.repeatDaily)
      ..writeByte(7)
      ..write(obj.files)
      ..writeByte(8)
      ..write(obj.groupName)
      ..writeByte(9)
      ..write(obj.listName)
      ..writeByte(10)
      ..write(obj.modificationDate)
      ..writeByte(11)
      ..write(obj.dateCreated)
      ..writeByte(12)
      ..write(obj.dateCompleted);
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

_$_TaskModel _$$_TaskModelFromJson(Map<String, dynamic> json) => _$_TaskModel(
      localId: json['localId'] as String,
      remoteId: json['remoteId'] as String?,
      title: json['title'] as String?,
      note: json['note'] as String?,
      completed: json['completed'] as bool? ?? false,
      addedToMyDay: json['addedToMyDay'] as bool? ?? false,
      repeatDaily: json['repeatDaily'] as bool? ?? false,
      files:
          (json['files'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      groupName: json['groupName'] as String?,
      listName: json['listName'] as String?,
      modificationDate: DateTime.parse(json['modificationDate'] as String),
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      dateCompleted: json['dateCompleted'] == null
          ? null
          : DateTime.parse(json['dateCompleted'] as String),
    );

Map<String, dynamic> _$$_TaskModelToJson(_$_TaskModel instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'remoteId': instance.remoteId,
      'title': instance.title,
      'note': instance.note,
      'completed': instance.completed,
      'addedToMyDay': instance.addedToMyDay,
      'repeatDaily': instance.repeatDaily,
      'files': instance.files,
      'groupName': instance.groupName,
      'listName': instance.listName,
      'modificationDate': instance.modificationDate.toIso8601String(),
      'dateCreated': instance.dateCreated.toIso8601String(),
      'dateCompleted': instance.dateCompleted?.toIso8601String(),
    };
