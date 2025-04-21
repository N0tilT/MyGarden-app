import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/core/data/repository/common_repository_Impl.dart';
import 'package:my_garden_app/feature/plant_list/data/model/light_need_model.dart';

class LightNeedRepositoryImpl
    extends CommonRepositoryImpl<List<LightNeedModel>, CommonRequestModel> {
  LightNeedRepositoryImpl({
    required super.remoteDataSource,
    required super.localDataSource,
    required super.networkInfo,
  });
}
