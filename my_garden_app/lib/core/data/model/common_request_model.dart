import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_request_model.freezed.dart';
part 'common_request_model.g.dart';

@freezed
class CommonRequestModel with _$CommonRequestModel {
  const factory CommonRequestModel({
    required String? userId,
    required List<int>? ids,
  }) = _CommonRequestModel;

  factory CommonRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CommonRequestModelFromJson(json);
}
