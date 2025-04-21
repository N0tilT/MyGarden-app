import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/core/data/repository/common_repository_Impl.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_type_model.dart';

class PlantTypeRepositoryImpl
    extends CommonRepositoryImpl<List<PlantTypeModel>, CommonRequestModel> {
  PlantTypeRepositoryImpl({
    required super.remoteDataSource,
    required super.localDataSource,
    required super.networkInfo,
  });
}
