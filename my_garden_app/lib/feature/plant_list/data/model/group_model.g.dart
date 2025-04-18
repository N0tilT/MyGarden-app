// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupModelAdapter extends TypeAdapter<_$GroupModelImpl> {
  @override
  final int typeId = 5;

  @override
  _$GroupModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$GroupModelImpl(
      id: fields[0] as int,
      title: fields[1] as String?,
      userId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$GroupModelImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupModelImpl _$$GroupModelImplFromJson(Map<String, dynamic> json) =>
    _$GroupModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$GroupModelImplToJson(_$GroupModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'userId': instance.userId,
    };
