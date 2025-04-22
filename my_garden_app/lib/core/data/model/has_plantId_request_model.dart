import 'package:freezed_annotation/freezed_annotation.dart';

part 'has_plantId_request_model.freezed.dart';
part 'has_plantId_request_model.g.dart';

@freezed
class HasPlantidRequestModel with _$HasPlantidRequestModel {
  const factory HasPlantidRequestModel({
    required String? userId,
    required List<int>? ids,
    required List<int>? plantIds,
  }) = _HasPlantidRequestModel;

  factory HasPlantidRequestModel.fromJson(Map<String, dynamic> json) =>
      _$HasPlantidRequestModelFromJson(json);
}
