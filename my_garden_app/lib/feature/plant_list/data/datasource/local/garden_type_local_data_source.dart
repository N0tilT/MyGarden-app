import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_type_model.dart';

class GardenTypeLocalDataSource
    extends LocalDataSource<List<GardenTypeModel>, void> {
  Box<GardenTypeModel> gardenTypeBox;

  GardenTypeLocalDataSource({required this.gardenTypeBox});

  @override
  Future<void> update(List<GardenTypeModel> gardenTypeList) async {
    try {
      if (gardenTypeList.isEmpty) {
        gardenTypeBox.clear();
        return;
      }
      await updateBox<GardenTypeModel>(
        {for (final item in gardenTypeList) item.id: item},
        gardenTypeBox.values.map((e) => e.id).toList(),
        gardenTypeBox,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<GardenTypeModel>> load(void request) async {
    try {
      return gardenTypeBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }
}
