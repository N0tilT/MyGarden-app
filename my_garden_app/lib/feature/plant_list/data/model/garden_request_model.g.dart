// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garden_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GardenRequestModelImpl _$$GardenRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GardenRequestModelImpl(
      userId: json['userId'] as String?,
      ids: (json['ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$GardenRequestModelImplToJson(
        _$GardenRequestModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'ids': instance.ids,
    };
