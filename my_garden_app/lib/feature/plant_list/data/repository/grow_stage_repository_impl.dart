import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/core/data/repository/common_repository_Impl.dart';
import 'package:my_garden_app/feature/plant_list/data/model/grow_stage_model.dart';

class GrowStageRepositoryImpl
    extends CommonRepositoryImpl<List<GrowStageModel>, CommonRequestModel> {
  GrowStageRepositoryImpl({
    required super.remoteDataSource,
    required super.localDataSource,
    required super.networkInfo,
  });
}
