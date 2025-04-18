// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantRequestModelImpl _$$PlantRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PlantRequestModelImpl(
      userId: json['userId'] as String,
      ids: (json['ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$PlantRequestModelImplToJson(
        _$PlantRequestModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'ids': instance.ids,
    };
