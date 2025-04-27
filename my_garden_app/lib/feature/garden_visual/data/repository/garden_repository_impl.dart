import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/core/data/repository/common_repository_Impl.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';

class GardenRepositoryImpl
    extends CommonRepositoryImpl<List<GardenModel>, CommonRequestModel> {
  GardenRepositoryImpl({
    required super.remoteDataSource,
    required super.localDataSource,
    required super.networkInfo,
  });
}
