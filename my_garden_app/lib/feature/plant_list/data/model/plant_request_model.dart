import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_request_model.freezed.dart';
part 'plant_request_model.g.dart';

@freezed
class PlantRequestModel with _$PlantRequestModel {
  const factory PlantRequestModel({
    required String userId,
    required List<int>? ids,
  }) = _PlantRequestModel;

  factory PlantRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PlantRequestModelFromJson(json);
}
