// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_type_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlantTypeModelAdapter extends TypeAdapter<_$PlantTypeModelImpl> {
  @override
  final int typeId = 10;

  @override
  _$PlantTypeModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PlantTypeModelImpl(
      id: fields[0] as int,
      title: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$PlantTypeModelImpl obj) {
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
      other is PlantTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantTypeModelImpl _$$PlantTypeModelImplFromJson(Map<String, dynamic> json) =>
    _$PlantTypeModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$PlantTypeModelImplToJson(
        _$PlantTypeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
