import 'package:http/http.dart' as http;
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';

class PlantRemoteDataSource extends RemoteDataSource<List<PlantModel>, void> {
  final http.Client client;

  PlantRemoteDataSource({required this.client});

  @override
  Future<List<PlantModel>> load(void request) async {
    try {
      // final response = await client.get(
      //   Uri.parse('$BASE_URL/course'),
      // );
      // if (response.statusCode == 200) {
      //   final decoded = json.decode(response.body) as List<dynamic>;
      //   final responseModel = decoded
      //       .map((dynamic value) =>
      //           PlantModel.fromJson(value as Map<String, dynamic>),)
      //       .toList();
      //   return responseModel;
      // } else {
      //   throw ServerException();
      // }
      return [
        PlantModel(
          id: 0,
          title: "Роза",
          biologyTitle: "Rose",
          fertilization: "fertilization",
          toxicity: "toxicity",
          replacing: "replacing",
          description: "description",
          groupId: 1,
          wateringNeedId: 0,
          lightNeedId: 0,
          stageId: 0,
          imageId: 0,
          ripeningPeriod: 3,
        ),
        PlantModel(
          id: 1,
          title: "Гладиолус",
          biologyTitle: "Rose",
          fertilization: "fertilization",
          toxicity: "toxicity",
          replacing: "replacing",
          description: "description",
          groupId: 1,
          wateringNeedId: 0,
          lightNeedId: 0,
          stageId: 0,
          imageId: 0,
          ripeningPeriod: 3,
        ),
        PlantModel(
          id: 2,
          title: "Лилия",
          biologyTitle: "Rose",
          fertilization: "fertilization",
          toxicity: "toxicity",
          replacing: "replacing",
          description: "description",
          groupId: 1,
          wateringNeedId: 0,
          lightNeedId: 0,
          stageId: 0,
          imageId: 0,
          ripeningPeriod: 3,
        ),
        PlantModel(
          id: 3,
          title: "Огурец",
          biologyTitle: "Rose",
          fertilization: "fertilization",
          toxicity: "toxicity",
          replacing: "replacing",
          description: "description",
          groupId: 2,
          wateringNeedId: 0,
          lightNeedId: 0,
          stageId: 0,
          imageId: 0,
          ripeningPeriod: 3,
        ),
      ];
    } catch (e) {
      throw ServerException();
    }
  }
}
