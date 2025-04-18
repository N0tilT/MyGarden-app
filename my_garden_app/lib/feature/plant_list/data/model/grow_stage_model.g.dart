// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grow_stage_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GrowStageModelAdapter extends TypeAdapter<_$GrowStageModelImpl> {
  @override
  final int typeId = 7;

  @override
  _$GrowStageModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$GrowStageModelImpl(
      id: fields[0] as int,
      title: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$GrowStageModelImpl obj) {
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
      other is GrowStageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GrowStageModelImpl _$$GrowStageModelImplFromJson(Map<String, dynamic> json) =>
    _$GrowStageModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$GrowStageModelImplToJson(
        _$GrowStageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
