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
      fields[1] as String,
      fields[2] as String?,
      fields[5] as DateTime?,
      fields[6] == null ? false : fields[6] as bool,
    )
      ..completed = fields[3] == null ? false : fields[3] as bool
      ..completedDate = fields[4] as DateTime?
      ..modificationDate = fields[7] as DateTime?
      ..files = (fields[9] as List?)?.cast<String>();
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.note)
      ..writeByte(3)
      ..write(obj.completed)
      ..writeByte(4)
      ..write(obj.completedDate)
      ..writeByte(5)
      ..write(obj.dueDate)
      ..writeByte(6)
      ..write(obj.repeatDaily)
      ..writeByte(7)
      ..write(obj.modificationDate)
      ..writeByte(8)
      ..write(obj.creationDate)
      ..writeByte(9)
      ..write(obj.files);
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

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      json['title'] as String,
      json['note'] as String?,
      json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      json['repeatDaily'] as bool,
    )
      ..completed = json['completed'] as bool
      ..completedDate = json['completedDate'] == null
          ? null
          : DateTime.parse(json['completedDate'] as String)
      ..modificationDate = json['modificationDate'] == null
          ? null
          : DateTime.parse(json['modificationDate'] as String)
      ..files =
          (json['files'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'title': instance.title,
      'note': instance.note,
      'completed': instance.completed,
      'completedDate': instance.completedDate?.toIso8601String(),
      'dueDate': instance.dueDate?.toIso8601String(),
      'repeatDaily': instance.repeatDaily,
      'modificationDate': instance.modificationDate?.toIso8601String(),
      'files': instance.files,
    };
