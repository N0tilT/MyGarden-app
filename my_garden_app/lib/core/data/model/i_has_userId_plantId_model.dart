import 'package:my_garden_app/core/data/model/i_has_userId_model.dart';

abstract class IHasUserIdPlantIdModel<TEntity>
    extends IHasUseridModel<TEntity> {
  int get plantId;

  @override
  IHasUserIdPlantIdModel<TEntity> copyWith({String? userId, int? plantId});
  // ignore: avoid_unused_constructor_parameters
  factory IHasUserIdPlantIdModel.fromEntity(TEntity entity) =>
      throw UnimplementedError('fromModel() not implemented');
}
