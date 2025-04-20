import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/core/data/repository/common_repository_Impl.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_type_model.dart';

class GardenTypeRepositoryImpl
    extends CommonRepositoryImpl<GardenTypeModel, CommonRequestModel> {
  GardenTypeRepositoryImpl({
    required super.remoteDataSource,
    required super.localDataSource,
    required super.networkInfo,
  });
}
