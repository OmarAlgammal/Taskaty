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
      remoteId: DatabaseResponseMappers.jsonToId(json: json),
      localId:
          DatabaseResponseMappers.jsonToString(json: json, name: 'localId')!,
      title: DatabaseResponseMappers.jsonToString(json: json, name: 'title'),
      note: DatabaseResponseMappers.jsonToString(json: json, name: 'note'),
      completed:
          DatabaseResponseMappers.jsonToBool(json: json, name: 'completed'),
      addedToMyDay:
          DatabaseResponseMappers.jsonToBool(json: json, name: 'addedToMyDay'),
      repeatDaily:
          DatabaseResponseMappers.jsonToBool(json: json, name: 'repeatDaily'),
      files: DatabaseResponseMappers.jsonToListOfStrings(
              json: json, name: 'files') ??
          [],
      groupName:
          DatabaseResponseMappers.jsonToString(json: json, name: 'groupName'),
      listName:
          DatabaseResponseMappers.jsonToString(json: json, name: 'listName'),
      modificationDate: DatabaseResponseMappers.jsonToDate(
          json: json, name: 'modificationDate')!,
      dateCreated:
          DatabaseResponseMappers.jsonToDate(json: json, name: 'dateCreated')!,
      dateCompleted:
          DatabaseResponseMappers.jsonToDate(json: json, name: 'dateCompleted'),
    );

Map<String, dynamic> _$$_TaskModelToJson(_$_TaskModel instance) =>
    DatabaseResponseMappers.modelToJson(
        databaseId: ApiConstance.tasksDatabaseId,
        properties: [
          DatabaseResponseMappers.stringPropertyToJson(
              name: 'localId', value: instance.localId),
          DatabaseResponseMappers.stringPropertyToJson(
              name: 'title', value: instance.title),
          DatabaseResponseMappers.stringPropertyToJson(
              name: 'note', value: instance.note),
          DatabaseResponseMappers.checkboxPropertyToJson(
              name: 'completed', value: instance.completed),
          DatabaseResponseMappers.checkboxPropertyToJson(
              name: 'addedToMyDay', value: instance.addedToMyDay),
          DatabaseResponseMappers.checkboxPropertyToJson(
              name: 'repeatDaily', value: instance.repeatDaily),
          DatabaseResponseMappers.listOfStringPropertyToJson(
              name: 'files', value: instance.files),
          DatabaseResponseMappers.stringPropertyToJson(
              name: 'groupName', value: instance.groupName),
          DatabaseResponseMappers.stringPropertyToJson(
              name: 'listName', value: instance.listName),
          DatabaseResponseMappers.datePropertyToJson(
              name: 'modificationDate', value: instance.modificationDate),
          DatabaseResponseMappers.datePropertyToJson(
              name: 'dateCreated', value: DateTime.now()),
          DatabaseResponseMappers.datePropertyToJson(
              name: 'dateCompleted', value: instance.dateCompleted),
        ]);
