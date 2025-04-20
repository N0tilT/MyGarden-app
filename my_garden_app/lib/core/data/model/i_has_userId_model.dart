import 'package:my_garden_app/core/data/model/i_common_model.dart';

abstract class IHasUseridModel<TEntity> extends ICommonModel<TEntity> {
  String get userId;
  IHasUseridModel<TEntity> copyWith({String? userId});
  // ignore: avoid_unused_constructor_parameters
  factory IHasUseridModel.fromEntity(TEntity entity) =>
      throw UnimplementedError('fromModel() not implemented');
}
