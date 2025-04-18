import 'package:freezed_annotation/freezed_annotation.dart';

part 'garden_request_model.freezed.dart';
part 'garden_request_model.g.dart';

@freezed
class GardenRequestModel with _$GardenRequestModel {
  const factory GardenRequestModel({
    required String? userId,
    required List<int>? ids,
  }) = _GardenRequestModel;

  factory GardenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GardenRequestModelFromJson(json);
}
