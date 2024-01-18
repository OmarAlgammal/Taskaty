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
      fields[2] as String,
      fields[3] as String?,
      fields[6] as DateTime?,
      fields[7] == null ? false : fields[7] as bool,
    )
      .._localId = fields[0] as String
      ..remoteId = fields[1] as String?
      .._completed = fields[4] == null ? false : fields[4] as bool
      .._completedDate = fields[5] as DateTime?
      .._modificationDate = fields[8] as DateTime
      .._creationDate = fields[9] as DateTime
      .._files = (fields[10] as List?)?.cast<String>();
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj._localId)
      ..writeByte(1)
      ..write(obj.remoteId)
      ..writeByte(2)
      ..write(obj._title)
      ..writeByte(3)
      ..write(obj._note)
      ..writeByte(4)
      ..write(obj._completed)
      ..writeByte(5)
      ..write(obj._completedDate)
      ..writeByte(6)
      ..write(obj._dueDate)
      ..writeByte(7)
      ..write(obj._repeatDaily)
      ..writeByte(8)
      ..write(obj._modificationDate)
      ..writeByte(9)
      ..write(obj._creationDate)
      ..writeByte(10)
      ..write(obj._files);
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
