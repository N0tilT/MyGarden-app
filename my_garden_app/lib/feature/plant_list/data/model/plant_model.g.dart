// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseModelAdapter extends TypeAdapter<_$PlantModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$PlantModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PlantModelImpl(
      id: fields[0] as int,
      title: fields[1] as String?,
      biologyTitle: fields[2] as String?,
      fertilization: fields[3] as String?,
      toxicity: fields[4] as String?,
      replacing: fields[5] as String?,
      description: fields[6] as String?,
      groupId: fields[7] as int,
      wateringNeedId: fields[8] as int,
      lightNeedId: fields[9] as int,
      stageId: fields[10] as int,
      imageId: fields[11] as int,
      ripeningPeriod: fields[12] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$PlantModelImpl obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.biologyTitle)
      ..writeByte(3)
      ..write(obj.fertilization)
      ..writeByte(4)
      ..write(obj.toxicity)
      ..writeByte(5)
      ..write(obj.replacing)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.groupId)
      ..writeByte(8)
      ..write(obj.wateringNeedId)
      ..writeByte(9)
      ..write(obj.lightNeedId)
      ..writeByte(10)
      ..write(obj.stageId)
      ..writeByte(11)
      ..write(obj.imageId)
      ..writeByte(12)
      ..write(obj.ripeningPeriod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantModelImpl _$$PlantModelImplFromJson(Map<String, dynamic> json) =>
    _$PlantModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      biologyTitle: json['biologyTitle'] as String?,
      fertilization: json['fertilization'] as String?,
      toxicity: json['toxicity'] as String?,
      replacing: json['replacing'] as String?,
      description: json['description'] as String?,
      groupId: (json['groupId'] as num).toInt(),
      wateringNeedId: (json['wateringNeedId'] as num).toInt(),
      lightNeedId: (json['lightNeedId'] as num).toInt(),
      stageId: (json['stageId'] as num).toInt(),
      imageId: (json['imageId'] as num).toInt(),
      ripeningPeriod: (json['ripeningPeriod'] as num).toInt(),
    );

Map<String, dynamic> _$$PlantModelImplToJson(_$PlantModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'biologyTitle': instance.biologyTitle,
      'fertilization': instance.fertilization,
      'toxicity': instance.toxicity,
      'replacing': instance.replacing,
      'description': instance.description,
      'groupId': instance.groupId,
      'wateringNeedId': instance.wateringNeedId,
      'lightNeedId': instance.lightNeedId,
      'stageId': instance.stageId,
      'imageId': instance.imageId,
      'ripeningPeriod': instance.ripeningPeriod,
    };
