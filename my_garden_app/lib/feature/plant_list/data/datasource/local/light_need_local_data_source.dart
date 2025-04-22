import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/light_need_model.dart';

class LightNeedLocalDataSource
    extends LocalDataSource<List<LightNeedModel>, CommonRequestModel> {
  Box<LightNeedModel> lightNeedBox;

  LightNeedLocalDataSource({required this.lightNeedBox});

  @override
  Future<void> update(List<LightNeedModel> lightNeedList) async {
    try {
      if (lightNeedList.isEmpty) {
        lightNeedBox.clear();
        return;
      }
      await updateBox<LightNeedModel>(
        {for (final item in lightNeedList) item.id: item},
        lightNeedBox.values.map((e) => e.id).toList(),
        lightNeedBox,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<LightNeedModel>> load(void request) async {
    try {
      return lightNeedBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await lightNeedBox.delete(id);
    } catch (e) {
      throw CacheException();
    }
  }
}
