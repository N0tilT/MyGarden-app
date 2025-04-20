// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommonRequestModelImpl _$$CommonRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CommonRequestModelImpl(
      userId: json['userId'] as String?,
      ids: (json['ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$CommonRequestModelImplToJson(
        _$CommonRequestModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'ids': instance.ids,
    };
