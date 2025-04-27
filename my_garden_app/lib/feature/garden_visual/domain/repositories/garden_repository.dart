import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/core/domain/repositories/common_repository.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';

abstract class GardenRepository
    extends CommonRepository<GardenModel, CommonRequestModel> {}
