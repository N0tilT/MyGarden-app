// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flower_bed_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FlowerBedModelAdapter extends TypeAdapter<_$FlowerBedModelImpl> {
  @override
  final int typeId = 3;

  @override
  _$FlowerBedModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$FlowerBedModelImpl(
      id: fields[0] as int,
      width: fields[1] as int,
      height: fields[2] as int,
      trueDx: fields[3] as double,
      trueDy: fields[4] as double,
      dx: fields[5] as double?,
      dy: fields[6] as double?,
      rotation: fields[7] as double,
      plantIds: (fields[8] as List).cast<int>(),
      gardenId: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, _$FlowerBedModelImpl obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.width)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.trueDx)
      ..writeByte(4)
      ..write(obj.trueDy)
      ..writeByte(5)
      ..write(obj.dx)
      ..writeByte(6)
      ..write(obj.dy)
      ..writeByte(7)
      ..write(obj.rotation)
      ..writeByte(9)
      ..write(obj.gardenId)
      ..writeByte(8)
      ..write(obj.plantIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlowerBedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlowerBedModelImpl _$$FlowerBedModelImplFromJson(Map<String, dynamic> json) =>
    _$FlowerBedModelImpl(
      id: (json['id'] as num).toInt(),
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      trueDx: (json['x'] as num).toDouble(),
      trueDy: (json['y'] as num).toDouble(),
      dx: (json['dx'] as num?)?.toDouble(),
      dy: (json['dy'] as num?)?.toDouble(),
      rotation: (json['rotationAngle'] as num).toDouble(),
      plantIds: (json['plants'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      gardenId: (json['gardenId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FlowerBedModelImplToJson(
        _$FlowerBedModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'x': instance.trueDx,
      'y': instance.trueDy,
      'dx': instance.dx,
      'dy': instance.dy,
      'rotationAngle': instance.rotation,
      'plants': instance.plantIds,
      'gardenId': instance.gardenId,
    };
