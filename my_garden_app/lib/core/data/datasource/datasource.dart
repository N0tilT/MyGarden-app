import 'package:hive/hive.dart';

abstract class LocalDataSource<ResponseType, RequestType> {
  Future<ResponseType> load(RequestType request);
  Future<void> update(ResponseType remoteLoad);
  Future<void> delete(int id);
}

abstract class RemoteDataSource<ResponseType, RequestType> {
  Future<ResponseType> load(RequestType request, String token);
  Future<void> upload(ResponseType remoteLoad, String token);
  Future<void> delete(int id, String token);
}

Future<void> updateBox<ModelType>(
  Map<int, ModelType> modelList,
  List<int> boxIds,
  Box<ModelType> box,
) async {
  final List<int> teachers = [];
  teachers.addAll(boxIds);
  teachers.addAll(modelList.keys);
  final ids = {...teachers};
  await box.putAll(
    {
      for (final id in modelList.keys.where((element) => ids.contains(element)))
        id: modelList[id] as ModelType,
    },
  );

  await box.deleteAll([
    for (final id in ids.where(
      (element) => !modelList.keys.contains(element),
    ))
      id,
  ]);
}
