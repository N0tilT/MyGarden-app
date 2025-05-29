// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_Prefill_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlantPrefillResponseModelAdapter
    extends TypeAdapter<_$PlantPrefillResponseModelImpl> {
  @override
  final int typeId = 12;

  @override
  _$PlantPrefillResponseModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PlantPrefillResponseModelImpl(
      type: fields[0] as String,
      articles: (fields[1] as List).cast<ArticleModel>(),
      labels: fields[2] as LabelsModel,
      summary: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$PlantPrefillResponseModelImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.labels)
      ..writeByte(5)
      ..write(obj.summary)
      ..writeByte(1)
      ..write(obj.articles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlantPrefillResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LabelsModelAdapter extends TypeAdapter<_$LabelsModelImpl> {
  @override
  final int typeId = 14;

  @override
  _$LabelsModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$LabelsModelImpl(
      wateringNeed: fields[0] as String,
      lightNeed: fields[1] as String,
      fertilizer: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$LabelsModelImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.wateringNeed)
      ..writeByte(1)
      ..write(obj.lightNeed)
      ..writeByte(2)
      ..write(obj.fertilizer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LabelsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ArticleModelAdapter extends TypeAdapter<_$ArticleModelImpl> {
  @override
  final int typeId = 15;

  @override
  _$ArticleModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ArticleModelImpl(
      title: fields[0] as String,
      link: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$ArticleModelImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantPrefillResponseModelImpl _$$PlantPrefillResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PlantPrefillResponseModelImpl(
      type: json['type'] as String,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      labels: LabelsModel.fromJson(json['labels'] as Map<String, dynamic>),
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$$PlantPrefillResponseModelImplToJson(
        _$PlantPrefillResponseModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'articles': instance.articles,
      'labels': instance.labels,
      'summary': instance.summary,
    };

_$LabelsModelImpl _$$LabelsModelImplFromJson(Map<String, dynamic> json) =>
    _$LabelsModelImpl(
      wateringNeed: json['WateringNeed'] as String,
      lightNeed: json['LightNeed'] as String,
      fertilizer: (json['Fertilizer'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$LabelsModelImplToJson(_$LabelsModelImpl instance) =>
    <String, dynamic>{
      'WateringNeed': instance.wateringNeed,
      'LightNeed': instance.lightNeed,
      'Fertilizer': instance.fertilizer,
    };

_$ArticleModelImpl _$$ArticleModelImplFromJson(Map<String, dynamic> json) =>
    _$ArticleModelImpl(
      title: json['title'] as String,
      link: json['link'] as String,
    );

Map<String, dynamic> _$$ArticleModelImplToJson(_$ArticleModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'link': instance.link,
    };
