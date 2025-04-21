import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/group_model.dart';

class GroupLocalDataSource
    extends LocalDataSource<List<GroupModel>, CommonRequestModel> {
  Box<GroupModel> groupBox;

  GroupLocalDataSource({required this.groupBox});

  @override
  Future<void> update(List<GroupModel> groupList) async {
    try {
      if (groupList.isEmpty) {
        groupBox.clear();
        return;
      }
      await updateBox<GroupModel>(
        {for (final item in groupList) item.id ?? -1: item},
        groupBox.values.map((e) => e.id!).toList(),
        groupBox,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<GroupModel>> load(void request) async {
    try {
      return groupBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }
}
