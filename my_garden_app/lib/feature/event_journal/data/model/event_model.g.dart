// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventModelAdapter extends TypeAdapter<_$EventModelImpl> {
  @override
  final int typeId = 2;

  @override
  _$EventModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$EventModelImpl(
      id: fields[0] as int?,
      title: fields[1] as String?,
      plantId: fields[2] as int,
      userId: fields[4] as String,
      date: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$EventModelImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.plantId)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventModelImpl _$$EventModelImplFromJson(Map<String, dynamic> json) =>
    _$EventModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      plantId: (json['plantId'] as num).toInt(),
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$EventModelImplToJson(_$EventModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'plantId': instance.plantId,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
    };
