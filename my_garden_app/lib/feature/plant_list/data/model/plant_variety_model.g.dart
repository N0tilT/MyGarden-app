// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_variety_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlantVarietyModelAdapter extends TypeAdapter<_$PlantVarietyModelImpl> {
  @override
  final int typeId = 11;

  @override
  _$PlantVarietyModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PlantVarietyModelImpl(
      id: fields[0] as int,
      title: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$PlantVarietyModelImpl obj) {
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
      other is PlantVarietyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantVarietyModelImpl _$$PlantVarietyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PlantVarietyModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$PlantVarietyModelImplToJson(
        _$PlantVarietyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
