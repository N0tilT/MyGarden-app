// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watering_need_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WateringNeedModelAdapter extends TypeAdapter<_$WateringNeedModelImpl> {
  @override
  final int typeId = 9;

  @override
  _$WateringNeedModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$WateringNeedModelImpl(
      id: fields[0] as int,
      title: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$WateringNeedModelImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WateringNeedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WateringNeedModelImpl _$$WateringNeedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WateringNeedModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$WateringNeedModelImplToJson(
        _$WateringNeedModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
