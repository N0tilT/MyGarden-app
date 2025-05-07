// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_recognition_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlantRecognitionResponseModelAdapter
    extends TypeAdapter<_$PlantRecognitionResponseModelImpl> {
  @override
  final int typeId = 11;

  @override
  _$PlantRecognitionResponseModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PlantRecognitionResponseModelImpl(
      id: fields[0] as int,
      title: fields[1] as String?,
      description: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$PlantRecognitionResponseModelImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlantRecognitionResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantRecognitionResponseModelImpl
    _$$PlantRecognitionResponseModelImplFromJson(Map<String, dynamic> json) =>
        _$PlantRecognitionResponseModelImpl(
          id: (json['id'] as num).toInt(),
          title: json['title'] as String?,
          description: json['description'] as String?,
        );

Map<String, dynamic> _$$PlantRecognitionResponseModelImplToJson(
        _$PlantRecognitionResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
