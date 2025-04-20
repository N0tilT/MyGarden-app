import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/core/domain/repositories/common_repository.dart';
import 'package:my_garden_app/feature/plant_list/data/model/group_model.dart';

abstract class GroupRepository
    extends CommonRepository<GroupModel, CommonRequestModel> {}
