import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/constant_values/routes.dart';
import 'package:my_garden_app/core/presentation/UI/garden_loading_widget.dart';
import 'package:my_garden_app/feature/auth/presentation/bloc/cubit/token_cubit.dart';
import 'package:my_garden_app/feature/event_journal/domain/entities/event_entity.dart';
import 'package:my_garden_app/feature/event_journal/presentation/bloc/cubit/event_cubit.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_list/plant_list_cubit.dart';

class EventCardBottomSheet extends StatefulWidget {
  final EventEntity event;

  const EventCardBottomSheet({super.key, required this.event});

  @override
  _EventCardBottomSheetState createState() => _EventCardBottomSheetState();
}

class _EventCardBottomSheetState extends State<EventCardBottomSheet> {
  late EventEntity _editedEvent;
  late bool _isEditing;
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    _editedEvent = widget.event;
    _isEditing = widget.event.id == null;
    _initializeControllers();
  }

  void _initializeControllers() {
    _controllers['title'] = TextEditingController(text: _editedEvent.title);
  }

  void _updateField(String field, dynamic value) {
    setState(() {
      _editedEvent = _editedEvent.copyWith(
        plantId: field == 'plantId' ? value as int : _editedEvent.plantId,
        date: field == 'date' ? value as DateTime : _editedEvent.date,
      );
    });
  }

  void _saveChanges() async {
    if (_formKey.currentState!.validate()) {
      final eventToSave = _editedEvent.copyWith(
        title: _controllers['title']!.text,
        date: _editedEvent.date.toUtc(),
      );
      await context.read<EventCubit>().upload(eventToSave);

      Navigator.pop(context);
      context.read<EventCubit>().load();
    }
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
            _editedEvent.id == null
                ? 'Новое событие'
                : _isEditing
                    ? 'Редактирование'
                    : _editedEvent.title ?? "Без названия",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(_isEditing ? Icons.save : Icons.close),
                onPressed: () {
                  setState(() {
                    if (_isEditing) {
                      _saveChanges();
                    } else {
                      Navigator.pop(context);
                      context.read<EventCubit>().load();
                    }
                  });
                },
              ),
              if (!_isEditing)
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => setState(() => _isEditing = true),
                ),
              if (_editedEvent.id != null)
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await context.read<EventCubit>().delete(_editedEvent.id!);
                    context.read<EventCubit>().load();
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
        BlocProvider.value(value: context.read<PlantListCubit>()..load()),
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
              final plants = context.watch<PlantListCubit>().state.maybeWhen(
                    success: (data) => data,
                    orElse: () => <PlantEntity>[],
                  );

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildEditableField('Название', 'title'),
                      _buildDateField(),
                      const SizedBox(height: 20),
                      _buildDropdown<PlantEntity>(
                        label: 'Растение',
                        items: plants,
                        currentId: _editedEvent.plantId,
                        displayText: (item) => item.title ?? "Без растения",
                        onChanged: (value) =>
                            _updateField('plantId', value?.id),
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
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              if (_isEditing)
                LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      width:
                          constraints.maxWidth, // Занимаем всю доступную ширину
                      child: DropdownButtonFormField<T>(
                        isExpanded: true, // Ключевое свойство для растягивания
                        value: items.isNotEmpty
                            ? items.firstWhere(
                                (item) => (item as dynamic).id == currentId,
                                orElse: () => items.first,
                              )
                            : null,
                        items: items.map((T item) {
                          return DropdownMenuItem<T>(
                            value: item,
                            child: Text(
                              displayText(item),
                              overflow: TextOverflow
                                  .ellipsis, // Обрезаем длинный текст
                              maxLines: 1, // Ограничиваем в одну строку
                            ),
                          );
                        }).toList(),
                        onChanged: (value) => {
                          setState(() {
                            onChanged(value);
                          })
                        },
                        decoration: const InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 14),
                        ),
                        validator: (value) =>
                            value == null ? 'Обязательное поле' : null,
                        menuMaxHeight: 300, // Ограничиваем высоту меню
                      ),
                    );
                  },
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
                  overflow: TextOverflow
                      .ellipsis, // Добавляем для нередактируемого режима
                  maxLines: 1,
                ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDateField() {
    return StatefulBuilder(
      builder: (context, setState) {
        String _formatDateTime(DateTime date) {
          return '${date.day}.${date.month}.${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Дата и время',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              if (_isEditing)
                FormField<DateTime>(
                  initialValue: _editedEvent.date,
                  validator: (value) {
                    if (value == null) {
                      return 'Пожалуйста, выберите дату и время';
                    }
                    return null;
                  },
                  builder: (formFieldState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () async {
                            // Получаем текущую дату из состояния
                            final currentDate =
                                formFieldState.value ?? DateTime.now();

                            // Выбор даты
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: currentDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (selectedDate == null) return;

                            // Выбор времени
                            final selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(currentDate),
                            );
                            if (selectedTime == null) return;

                            // Комбинируем выбранные дату и время
                            final newDateTime = DateTime(
                              selectedDate.year,
                              selectedDate.month,
                              selectedDate.day,
                              selectedTime.hour,
                              selectedTime.minute,
                            );

                            // Обновляем состояние формы и виджета
                            formFieldState.didChange(newDateTime);
                            setState(() {
                              _updateField('date', newDateTime);
                            });
                          },
                          child: Text(
                            _formatDateTime(formFieldState.value!),
                          ),
                        ),
                        if (formFieldState.hasError)
                          Text(
                            formFieldState.errorText!,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                      ],
                    );
                  },
                )
              else
                Text(
                  _formatDateTime(_editedEvent.date),
                  style: const TextStyle(fontSize: 16),
                ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
