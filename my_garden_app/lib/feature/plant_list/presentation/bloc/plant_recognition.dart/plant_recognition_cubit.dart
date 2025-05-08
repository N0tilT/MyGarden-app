import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_recognition_response_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/recognize/recognize_plant.dart';

part 'plant_recognition_cubit.freezed.dart';
part 'plant_recognition_state.dart';

class PlantRecognitionCubit extends Cubit<PlantRecognitionState> {
  final RecognizePlant recognizePlant;

  PlantRecognitionCubit({
    required this.recognizePlant,
  }) : super(const PlantRecognitionState.initial());

  Future<void> recognize(File file) async {
    emit(const PlantRecognitionState.loading());
    final result = await recognizePlant(file);
    result.fold(
      (error) => emit(PlantRecognitionState.remoteFail(error.message)),
      (success) => emit(PlantRecognitionState.recognizeSuccess(success)),
    );
  }
}
