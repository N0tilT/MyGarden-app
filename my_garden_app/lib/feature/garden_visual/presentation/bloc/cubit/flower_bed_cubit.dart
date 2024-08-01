import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/flower_bed_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/flower_bed_entity.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/load_flower_beds.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/remove_flower_bed.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/upload_flower_bed.dart';

part 'flower_bed_cubit.freezed.dart';
part 'flower_bed_state.dart';

class FlowerBedCubit extends Cubit<FlowerBedState> {
  final LoadFlowerBeds loadFlowerBeds;
  final UploadFlowerBed uploadFlowerBed;
  final RemoveFlowerBed removeFlowerBed;
  List<FlowerBedEntity> flowerBeds = [];

  FlowerBedCubit(
      {required this.removeFlowerBed,
      required this.loadFlowerBeds,
      required this.uploadFlowerBed,})
      : super(const FlowerBedState.initial());

  Future<void> upload(FlowerBedEntity flowerBed) async {
    final int nextId =
        flowerBeds.isEmpty ? 1 : (flowerBeds.map((e) => e.id).reduce(max) + 1);
    flowerBed.id = nextId;
    flowerBeds.add(flowerBed);
    final result = await uploadFlowerBed(flowerBeds
        .map(
          (e) => FlowerBedModel(
            id: e.id,
            width: e.width,
            height: e.height,
            trueDx: e.truePosition.dx,
            trueDy: e.truePosition.dy,
            dx: e.position.dx,
            dy: e.position.dy,
            rotation: e.rotation,
            plantIds: e.plantIds,
          ),
        )
        .toList(),);
    result.fold(
      (error) => emit(FlowerBedState.fail(error.message)),
      (success) => emit(FlowerBedState.success(flowerBeds)),
    );
  }

  Future<void> load() async {
    emit(const FlowerBedState.loading());
    final result = await loadFlowerBeds(() {});
    result.fold(
      (error) => emit(FlowerBedState.fail(error.message)),
      (succededFlowerBedList) {
        flowerBeds = succededFlowerBedList
            .map((e) => FlowerBedEntity.fromModel(e))
            .toList();
        emit(
          FlowerBedState.success(
            flowerBeds,
          ),
        );
      },
    );
  }

  Future<void> remove(FlowerBedEntity flowerBed) async {
    flowerBeds.remove(flowerBed);
    final result = await uploadFlowerBed(flowerBeds
        .map(
          (e) => FlowerBedModel(
            id: e.id,
            width: e.width,
            height: e.height,
            trueDx: e.truePosition.dx,
            trueDy: e.truePosition.dy,
            dx: e.position.dx,
            dy: e.position.dy,
            rotation: e.rotation,
            plantIds: e.plantIds,
          ),
        )
        .toList(),);
    result.fold(
      (error) => emit(FlowerBedState.fail(error.message)),
      (success) => emit(FlowerBedState.success(flowerBeds)),
    );
  }
}
