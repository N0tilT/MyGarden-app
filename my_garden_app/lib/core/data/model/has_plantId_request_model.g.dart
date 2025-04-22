// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'has_plantId_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HasPlantidRequestModelImpl _$$HasPlantidRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HasPlantidRequestModelImpl(
      userId: json['userId'] as String?,
      ids: (json['ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      plantIds: (json['plantIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$HasPlantidRequestModelImplToJson(
        _$HasPlantidRequestModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'ids': instance.ids,
      'plantIds': instance.plantIds,
    };
