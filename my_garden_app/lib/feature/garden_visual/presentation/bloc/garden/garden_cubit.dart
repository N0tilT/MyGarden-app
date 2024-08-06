import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/garden_entity.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/load_gardens.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/remove_garden.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/upload_garden.dart';

part 'garden_cubit.freezed.dart';
part 'garden_state.dart';

class GardenCubit extends Cubit<GardenState> {
  final LoadGardens loadGardens;
  final UploadGarden uploadGarden;
  final RemoveGarden removeGarden;
  List<GardenEntity> gardens = [];

  GardenCubit(
      {required this.removeGarden,
      required this.loadGardens,
      required this.uploadGarden,})
      : super(const GardenState.initial());

  Future<void> upload(GardenEntity garden) async {
    final int nextId =
        gardens.isEmpty ? 1 : (gardens.map((e) => e.id).reduce(max) + 1);
    garden.id = nextId;
    gardens.add(garden);
    final result = await uploadGarden(gardens
        .map(
          (e) => GardenModel(
            id: e.id,
            title: e.title,
          ),
        )
        .toList(),);
    result.fold(
      (error) => emit(GardenState.fail(error.message)),
      (success) => emit(GardenState.success(gardens)),
    );
  }

  Future<void> update(GardenEntity garden) async {
    gardens[gardens.indexOf(garden)] = garden;
    final result = await uploadGarden(gardens
        .map(
          (e) => GardenModel(
            id: e.id,
            title: e.title,
          ),
        )
        .toList(),);
    result.fold(
      (error) => emit(GardenState.fail(error.message)),
      (success) => emit(GardenState.success(gardens)),
    );
  }

  Future<void> load() async {
    emit(const GardenState.loading());
    final result = await loadGardens(() {});
    result.fold(
      (error) => emit(GardenState.fail(error.message)),
      (succededGardenList) {
        gardens = succededGardenList
            .map((e) => GardenEntity.fromModel(e))
            .toList();
        emit(
          GardenState.success(
            gardens,
          ),
        );
      },
    );
  }

  Future<void> remove(GardenEntity flowerBed) async {
    gardens.remove(flowerBed);
    final result = await uploadGarden(gardens
        .map(
          (e) => GardenModel(
            id: e.id,
            title: e.title,
          ),
        )
        .toList(),);
    result.fold(
      (error) => emit(GardenState.fail(error.message)),
      (success) => emit(GardenState.success(gardens)),
    );
  }
}
