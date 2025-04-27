import 'dart:convert';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SelectedGardenDataSource {
  Future<void> setGarden(GardenModel groupModel);
  Future<GardenModel> getGarden();
}

class SelectedGardenDataSourceImpl implements SelectedGardenDataSource {
  SharedPreferences prefs;

  SelectedGardenDataSourceImpl({required this.prefs});

  @override
  Future<GardenModel> getGarden() async {
    try {
      final result = prefs.getString('department');
      if (result != null) {
        final garden = GardenModel.fromJson(
          json.decode(result) as Map<String, dynamic>,
        );
        return garden;
      } else {
        throw CacheException();
      }
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> setGarden(GardenModel garden) async {
    try {
      prefs.setString(
        'department',
        json.encode(
          garden.toJson(),
        ),
      );
    } catch (e) {
      throw CacheException();
    }
  }
}
