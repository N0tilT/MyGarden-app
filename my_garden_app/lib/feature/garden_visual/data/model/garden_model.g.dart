// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garden_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GardenModelAdapter extends TypeAdapter<_$GardenModelImpl> {
  @override
  final int typeId = 4;

  @override
  _$GardenModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$GardenModelImpl(
      id: fields[0] as int,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$GardenModelImpl obj) {
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
      other is GardenModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GardenModelImpl _$$GardenModelImplFromJson(Map<String, dynamic> json) =>
    _$GardenModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$$GardenModelImplToJson(_$GardenModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
