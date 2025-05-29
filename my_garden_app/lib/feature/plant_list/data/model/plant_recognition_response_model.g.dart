// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_recognition_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlantRecognitionResponseModelAdapter
    extends TypeAdapter<_$PlantRecognitionResponseModelImpl> {
  @override
  final int typeId = 13;

  @override
  _$PlantRecognitionResponseModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PlantRecognitionResponseModelImpl(
      message: fields[0] as String,
      filename: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$PlantRecognitionResponseModelImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.filename);
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
          message: json['message'] as String,
          filename: json['filename'] as String,
        );

Map<String, dynamic> _$$PlantRecognitionResponseModelImplToJson(
        _$PlantRecognitionResponseModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'filename': instance.filename,
    };
