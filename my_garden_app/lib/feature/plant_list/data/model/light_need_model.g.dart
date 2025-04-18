// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_need_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LightNeedModelAdapter extends TypeAdapter<_$LightNeedModelImpl> {
  @override
  final int typeId = 8;

  @override
  _$LightNeedModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$LightNeedModelImpl(
      id: fields[0] as int,
      title: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$LightNeedModelImpl obj) {
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
      other is LightNeedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LightNeedModelImpl _$$LightNeedModelImplFromJson(Map<String, dynamic> json) =>
    _$LightNeedModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$LightNeedModelImplToJson(
        _$LightNeedModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
