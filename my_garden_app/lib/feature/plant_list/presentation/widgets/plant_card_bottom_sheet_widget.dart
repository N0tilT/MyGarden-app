import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_garden_app/core/constant_values/routes.dart';
import 'package:my_garden_app/core/presentation/UI/garden_loading_widget.dart';
import 'package:my_garden_app/feature/auth/presentation/bloc/cubit/token_cubit.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/group_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/grow_stage_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/light_need_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_type_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_variety_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/watering_need_entity.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/group/group_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/grow_stage/grow_stage_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/light_need/light_need_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_list/plant_list_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_recognition.dart/plant_recognition_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_type/plant_type_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_variety/plant_variety_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/watering_need/watering_need_cubit.dart';

class PlantCardBottomSheet extends StatefulWidget {
  final PlantEntity plant;

  const PlantCardBottomSheet({super.key, required this.plant});

  @override
  _PlantCardBottomSheetState createState() => _PlantCardBottomSheetState();
}

class _PlantCardBottomSheetState extends State<PlantCardBottomSheet> {
  late PlantEntity _editedPlant;
  late bool _isEditing;
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    _editedPlant = widget.plant;
    _isEditing = widget.plant.id == null;
    _initializeControllers();
  }

  void _initializeControllers() {
    _controllers['title'] = TextEditingController(text: _editedPlant.title);
    _controllers['biologyTitle'] =
        TextEditingController(text: _editedPlant.biologyTitle);
    _controllers['fertilization'] =
        TextEditingController(text: _editedPlant.fertilization);
    _controllers['toxicity'] =
        TextEditingController(text: _editedPlant.toxicity);
    _controllers['replacing'] =
        TextEditingController(text: _editedPlant.replacing);
    _controllers['description'] =
        TextEditingController(text: _editedPlant.description);
    _controllers['ripeningPeriod'] =
        TextEditingController(text: _editedPlant.ripeningPeriod.toString());
  }

  void _updateField(String field, dynamic value) {
    setState(() {
      _editedPlant = _editedPlant.copyWith(
        groupId: field == 'groupId' ? value as int : _editedPlant.groupId,
        wateringNeedId: field == 'wateringNeedId'
            ? value as int
            : _editedPlant.wateringNeedId,
        lightNeedId:
            field == 'lightNeedId' ? value as int : _editedPlant.lightNeedId,
        plantTypeId:
            field == 'plantTypeId' ? value as int : _editedPlant.plantTypeId,
        plantVarietyId: field == 'plantVarietyId'
            ? value as int
            : _editedPlant.plantVarietyId,
        stageId: field == 'stageId' ? value as int : _editedPlant.stageId,
      );
    });
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      final plantToSave = _editedPlant.copyWith(
        title: _controllers['title']!.text,
        biologyTitle: _controllers['biologyTitle']!.text,
        fertilization: _controllers['fertilization']!.text,
        toxicity: _controllers['toxicity']!.text,
        replacing: _controllers['replacing']!.text,
        description: _controllers['description']!.text,
        ripeningPeriod: int.tryParse(_controllers['ripeningPeriod']!.text) ?? 0,
      );

      if (plantToSave.id == null) {
        context.read<PlantListCubit>().upload(plantToSave);
      } else {
        context.read<PlantListCubit>().upload(plantToSave);
      }
      Navigator.pop(context);
    }
  }

  File? _selectedImage;

  bool _isRecognitionLoading = false;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_selectedImage == null) return;
    context.read<PlantRecognitionCubit>().recognize(_selectedImage!);
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 240, 241, 245),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _editedPlant.id == null
                ? 'Новое растение'
                : _isEditing
                    ? 'Редактирование'
                    : _editedPlant.title ?? "Без названия",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.camera),
                onPressed: () async {
                  await _pickImage(ImageSource.camera);
                  await _uploadImage();
                },
              ),
              IconButton(
                onPressed: () async {
                  await _pickImage(ImageSource.gallery);
                  await _uploadImage();
                },
                icon: const Icon(Icons.folder),
              ),
              IconButton(
                icon: Icon(_isEditing ? Icons.save : Icons.close),
                onPressed: () {
                  if (_isEditing) {
                    _saveChanges();
                  } else {
                    Navigator.pop(context);
                    context.read<PlantListCubit>().load();
                  }
                },
              ),
              if (!_isEditing)
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => setState(() => _isEditing = true),
                ),
              if (_editedPlant.id != null)
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context.read<PlantListCubit>().delete(_editedPlant.id!);
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: context.read<TokenCubit>()..getToken()),
        BlocProvider.value(value: context.read<GroupCubit>()..loadLocally()),
        BlocProvider.value(
          value: context.read<WateringNeedCubit>()..loadLocally(),
        ),
        BlocProvider.value(
          value: context.read<LightNeedCubit>()..loadLocally(),
        ),
        BlocProvider.value(
          value: context.read<PlantTypeCubit>()..loadLocally(),
        ),
        BlocProvider.value(
          value: context.read<PlantVarietyCubit>()..loadLocally(),
        ),
        BlocProvider.value(
          value: context.read<GrowStageCubit>()..loadLocally(),
        ),
        BlocProvider.value(
          value: context.read<PlantRecognitionCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return context.watch<TokenCubit>().state.when(
            initial: () {
              return const Center(child: GardenLoadingWidget());
            },
            authorized: (token) {
              return const Center(child: GardenLoadingWidget());
            },
            fail: (l) {
              Navigator.of(context).pushReplacementNamed(authRoute);
              return const Center(child: GardenLoadingWidget());
            },
            unauthorized: () {
              context.watch<TokenCubit>().passValidation();
              return const Center(child: GardenLoadingWidget());
            },
            tokenSuccess: (token) {
              final groups = context.watch<GroupCubit>().state.maybeWhen(
                    success: (data) => data,
                    orElse: () => <GroupEntity>[],
                  );

              final wateringNeeds =
                  context.watch<WateringNeedCubit>().state.maybeWhen(
                        success: (data) => data,
                        orElse: () => <WateringNeedEntity>[],
                      );

              final lightNeeds =
                  context.watch<LightNeedCubit>().state.maybeWhen(
                        success: (data) => data,
                        orElse: () => <LightNeedEntity>[],
                      );

              final plantTypes =
                  context.watch<PlantTypeCubit>().state.maybeWhen(
                        success: (data) => data,
                        orElse: () => <PlantTypeEntity>[],
                      );

              final plantVarieties =
                  context.watch<PlantVarietyCubit>().state.maybeWhen(
                        success: (data) => data,
                        orElse: () => <PlantVarietyEntity>[],
                      );

              final growStages =
                  context.watch<GrowStageCubit>().state.maybeWhen(
                        success: (data) => data,
                        orElse: () => <GrowStageEntity>[],
                      );

              context.watch<PlantRecognitionCubit>().state.maybeWhen(
                    recognizeSuccess: (plant) {
                      _editedPlant = _editedPlant.copyWith(
                        title: plant.title,
                        description: plant.description,
                      );
                      _controllers['title']!.value =
                          TextEditingValue(text: _editedPlant.title ?? "");
                      _controllers['description']!.value = TextEditingValue(
                        text: _editedPlant.description ?? "",
                      );
                      _isRecognitionLoading = false;
                    },
                    loading: () => _isRecognitionLoading = true,
                    orElse: () => {},
                  );

              return _isRecognitionLoading
                  ? const GardenLoadingWidget()
                  : SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildEditableField('Название', 'title'),
                            _buildEditableField(
                              'Биологическое название',
                              'biologyTitle',
                              isRequired: false,
                            ),
                            _buildEditableField(
                              'Удобрение',
                              'fertilization',
                              isRequired: false,
                            ),
                            _buildEditableField(
                              'Токсичность',
                              'toxicity',
                              isRequired: false,
                            ),
                            _buildEditableField(
                              'Пересадка',
                              'replacing',
                              isRequired: false,
                            ),
                            _buildEditableField(
                              'Описание',
                              'description',
                              isRequired: false,
                            ),
                            _buildEditableField(
                              'Период созревания (дни)',
                              'ripeningPeriod',
                              isRequired: false,
                              isNumber: true,
                            ),
                            const SizedBox(height: 20),
                            _buildDropdown<GroupEntity>(
                              label: 'Группа',
                              items: groups,
                              currentId: _editedPlant.groupId,
                              displayText: (item) =>
                                  item.title ?? "Без названия",
                              onChanged: (value) =>
                                  _updateField('groupId', value?.id),
                            ),
                            _buildDropdown<WateringNeedEntity>(
                              label: 'Полив',
                              items: wateringNeeds,
                              currentId: _editedPlant.wateringNeedId,
                              displayText: (item) =>
                                  item.title ?? "Без названия",
                              onChanged: (value) =>
                                  _updateField('wateringNeedId', value?.id),
                            ),
                            _buildDropdown<LightNeedEntity>(
                              label: 'Освещение',
                              items: lightNeeds,
                              currentId: _editedPlant.lightNeedId,
                              displayText: (item) =>
                                  item.title ?? "Без названия",
                              onChanged: (value) =>
                                  _updateField('lightNeedId', value?.id),
                            ),
                            _buildDropdown<PlantTypeEntity>(
                              label: 'Тип растения',
                              items: plantTypes,
                              currentId: _editedPlant.plantTypeId,
                              displayText: (item) =>
                                  item.title ?? "Без названия",
                              onChanged: (value) =>
                                  _updateField('plantTypeId', value?.id),
                            ),
                            _buildDropdown<PlantVarietyEntity>(
                              label: 'Разновидность',
                              items: plantVarieties,
                              currentId: _editedPlant.plantVarietyId,
                              displayText: (item) =>
                                  item.title ?? "Без названия",
                              onChanged: (value) =>
                                  _updateField('plantVarietyId', value?.id),
                            ),
                            _buildDropdown<GrowStageEntity>(
                              label: 'Стадия роста',
                              items: growStages,
                              currentId: _editedPlant.stageId,
                              displayText: (item) =>
                                  item.title ?? "Без названия",
                              onChanged: (value) =>
                                  _updateField('stageId', value?.id),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
            },
          );
        },
      ),
    );
  }

  Widget _buildEditableField(
    String label,
    String fieldKey, {
    bool isRequired = true,
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          if (_isEditing)
            TextFormField(
              controller: _controllers[fieldKey],
              keyboardType:
                  isNumber ? TextInputType.number : TextInputType.text,
              decoration: const InputDecoration(
                isDense: true,
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (isRequired && (value == null || value.isEmpty)) {
                  return 'Обязательное поле';
                }
                if (isNumber && value!.isNotEmpty) {
                  if (int.tryParse(value) == null) {
                    return 'Введите число';
                  }
                }
                return null;
              },
            )
          else
            Text(
              _controllers[fieldKey]!.text.isNotEmpty
                  ? _controllers[fieldKey]!.text
                  : 'Не указано',
              style: const TextStyle(fontSize: 16),
            ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildDropdown<T>({
    required String label,
    required List<T> items,
    required int currentId,
    required String Function(T) displayText,
    required void Function(T?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          if (_isEditing)
            DropdownButtonFormField<T>(
              value: items.isNotEmpty
                  ? items.firstWhere(
                      (item) => (item as dynamic).id == currentId,
                      orElse: () => items.first,
                    )
                  : null,
              items: items.map((T item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(displayText(item)),
                );
              }).toList(),
              onChanged: onChanged,
              decoration: const InputDecoration(
                isDense: true,
                border: OutlineInputBorder(),
              ),
              validator: (value) => value == null ? 'Обязательное поле' : null,
            )
          else
            Text(
              items.isNotEmpty
                  ? displayText(
                      items.firstWhere(
                        (item) => (item as dynamic).id == currentId,
                        orElse: () => items.first,
                      ),
                    )
                  : 'Не указано',
              style: const TextStyle(fontSize: 16),
            ),
          const Divider(),
        ],
      ),
    );
  }
}
